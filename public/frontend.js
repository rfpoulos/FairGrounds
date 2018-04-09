const signIn = document.getElementById('sign-in-page');
const rateArticles = document.getElementById('rate-articles');
const viewArticles = document.getElementById('view-articles');
const $viewButton = $('#view');
const $signInButton = $('#sign-in');
const $printResult = $('.printResults');
const $printArticleForRating = $('.printArticleForRating');


//drawing tiles functions
let printArticles = (source, divToAppend) => {
	let $thumbnailDiv = $('<div></div>').addClass('thumbnail');
	divToAppend.append($thumbnailDiv);
	
	let $thumbnailImgContainer = $('<div></div>').addClass('image-container');
	$thumbnailDiv.append($thumbnailImgContainer);
	
	let $thumbnailImg = $('<img></img>').attr('src', source.urltoimage);
	$thumbnailImg.attr('alt', 'Story Image');
	$thumbnailImg.addClass('news-image');
	$thumbnailImgContainer.append($thumbnailImg);

	let $titleH2 = $('<h2></h2>').addClass('title');
	$titleH2.text(source.title);
	$thumbnailDiv.append($titleH2);
	
	let $authorSourceDate = $('<h6></h6>').addClass('author-source-date');
	$authorSourceDate.text(`By ${source.author} from ${source.source} on ${source.publishedat}`);
	$thumbnailDiv.append($authorSourceDate);

	let $descriptionH4 = $('<p></p>').addClass('description');
	$descriptionH4.text(source.description);
	$thumbnailDiv.append($descriptionH4);

	let $viewArticleButton = $('<button></button>').addClass('view-article-button');
	$viewArticleButton.attr('type', 'button');
	$viewArticleButton.text('View Article');
	$viewArticleButton.click(() => {
		window.open(source.url);
	});
    $thumbnailDiv.append($viewArticleButton);
    
    let $ratingsDiv = $('<div></div>').addClass('ratings-container');
    $thumbnailDiv.append($ratingsDiv);

    let $conservativeRating = $('<div></div').addClass('rating');
    $conservativeRating.text('C: ' + parseInt(source.conservative_score * 100));
    $ratingsDiv.append($conservativeRating);

    let $moderateRating = $('<div></div').addClass('rating');
    $moderateRating.text('M: ' +parseInt(source.moderate_score * 100));
    $ratingsDiv.append($moderateRating);

    let $liberalRating = $('<div></div').addClass('rating');
    $liberalRating.text('L: ' + parseInt(source.liberal_score * 100));
    $ratingsDiv.append($liberalRating);

    let $totalRating = $('<div></div').addClass('rating');
    $totalRating.text('T: ' + parseInt(source.total_score * 100));
    $ratingsDiv.append($totalRating);
}

let printArticlesForRating = (articlesArray, divToAppend, currentArticle) => {
	divToAppend.empty();

	let $thumbnailDiv = $('<div></div>').addClass('thumbnail');
	divToAppend.append($thumbnailDiv);
	
	let $thumbnailImgContainer = $('<div></div>').addClass('image-container');
	$thumbnailDiv.append($thumbnailImgContainer);
	
	let $thumbnailImg = $('<img></img>').attr('src', articlesArray[currentArticle].urltoimage);
	$thumbnailImg.attr('alt', 'Story Image');
	$thumbnailImg.addClass('news-image');
	$thumbnailImgContainer.append($thumbnailImg);

	let $captionDiv = $('<div></div>').addClass('caption');
	$thumbnailDiv.append($captionDiv);

	let $titleH2 = $('<h2></h2>').addClass('title');
	$titleH2.text(articlesArray[currentArticle].title);
	$captionDiv.append($titleH2);
	
	let $authorSourceDate = $('<h6></h6>').addClass('author-source-date');
    $authorSourceDate.text(`By ${articlesArray[currentArticle].author} 
            from ${articlesArray[currentArticle].source} 
            on ${articlesArray[currentArticle].publishedat}`);
	$captionDiv.append($authorSourceDate);

	let $descriptionH4 = $('<p></p>').addClass('description');
	$descriptionH4.text(articlesArray[currentArticle].description);
	$captionDiv.append($descriptionH4);

	let $buttonDiv = $('<div></div>').addClass('view-article-div');
	$thumbnailDiv.append($buttonDiv);

	let $viewArticleButton = $('<button></button>').addClass('view-article-button');
	$viewArticleButton.attr('type', 'button');
	$viewArticleButton.text('View Article');
	$viewArticleButton.click(() => {
		window.open(articlesArray[currentArticle].url);
	});
    $buttonDiv.append($viewArticleButton);
    
    let $rateForm = $('<form></form>').addClass('rate-form');
    $rateForm.attr('name', 'new-rating');
    $thumbnailDiv.append($rateForm);

	let $fairArticle = $('<input></input>').addClass('fair-article-button');
    $fairArticle.attr('type', 'radio');
    $fairArticle.attr('name', 'written_fairly');
    $fairArticle.attr('value', '1');
    $rateForm.append($fairArticle);
    let $fairText = $('<div></div>');
    $fairText.text('Written Fairly');
    $rateForm.append($fairText);

	let $unfairArticle = $('<input>').addClass('unfair-article-button');
    $unfairArticle.attr('type', 'radio');
    $unfairArticle.attr('name', 'written_fairly');
    $unfairArticle.attr('value', '0');
    $rateForm.append($unfairArticle);
    let $unfairText = $('<div></div>');
    $unfairText.text('Written Unfairly');
    $rateForm.append($unfairText);

    let $topicInput = $('<select></select>').addClass('topic-input').attr('name', 'topic');
    $science = $('<option></option>').attr('value', 'Science').text('Science');
    $topicInput.append($science);
    $politics = $('<option></option>').attr('value', 'Politics').text('Politics');
    $topicInput.append($politics);
    $religion = $('<option></option>').attr('value', 'Religion').text('Religion');
    $topicInput.append($religion);
    $foreignPolicy = $('<option></option>').attr('value', 'Foreign Policy').text('Foreign Policy');
    $topicInput.append($foreignPolicy);
    $rateForm.append($topicInput);

    let $submitButton = $('<button></button>').addClass('topic-input-button').attr('type', 'button');
    $submitButton.text('Submit');
    $submitButton.click(() => {
        let form = $('.rate-form').serializeArray();
        let ratingsObject = {};
        form.forEach((element) => {
            let name = element.name;
            let value = element.value;
            ratingsObject[name] = value;
        })
        ratingsObject.written_fairly = parseInt(ratingsObject.written_fairly);
        ratingsObject.userid = getToken();
        ratingsObject.articleid = articlesArray[currentArticle].articleid;
        postRating(ratingsObject);
        articlesArray.splice(currentArticle, 1);
        if (articlesArray.length === currentArticle + 1 || articlesArray.length === 0){
            divToAppend.empty();
            let $noMore = $('<div></div>').addClass('no-more');
            $noMore.text('No more articles to rate.  Check back later!');
            divToAppend.append($noMore);
        } else {
            printArticlesForRating(articlesArray, $printArticleForRating, currentArticle);
        }
    })
    $rateForm.append($submitButton);

    
    let $skipArticleButton = $('<button></button>').addClass('skip-article-button');
	$skipArticleButton.attr('type', 'button');
	$skipArticleButton.text('Skip Article');
	$skipArticleButton.click(() => {
		if (articlesArray.length === currentArticle + 1){
            divToAppend.empty();
            let $noMore = $('<div></div>').addClass('no-more');
            $noMore.text('No more articles to rate.  Check back later!');
            divToAppend.append($noMore);
        } else {
            printArticlesForRating(articlesArray, $printArticleForRating, currentArticle + 1);
        }
	});
	$buttonDiv.append($skipArticleButton);
}

//sign-in info

let getToken = () => localStorage.getItem('token');

let setTokenToHeader = (token) => {
  let tokenHeader = new Headers();
  tokenHeader.append('authorization', token);
  return tokenHeader;
}

let createSignOutButton = () => {
  let signOutButton = document.createElement('li');
  signOutButton.classList.add('nav-button');
  signOutButton.setAttribute('id', 'sign-out');
  signOutButton.textContent = 'Sign Out';
  signOutButton.addEventListener('click', (event) => {
    localStorage.clear();
    window.location.href="/index.html";
  })
  return signOutButton;
}

  try {
    let token = getToken();
    let tokenHeader = setTokenToHeader(token);
    fetch('/token', {method: 'GET', headers: tokenHeader})
    .then(response => {
      if (response.status != 404) {
        $signInButton.remove();
        let signOutButton = createSignOutButton();
        let buttonParent = document.querySelector('.navigation-top');
        buttonParent.appendChild(signOutButton);
        let $footer = $('.navigation-bottom');
        let $rateButton = $('<li></li>').addClass('nav-button').attr('id', 'rate');
        $rateButton.text('Rate Articles');
        $footer.append($rateButton);
        showPageButton($rateButton, rateArticles);
        $rateButton.click(() => getDBArticleForRating(0, getToken()));
      };
    })
  } catch(err) {
    console.log(err);
  }

//database requests
let getDBArticleForRating = (articleToGet, userid) => {
    let idObject = {"userid": userid}
    fetch('/articlestorate', 
        {method: 'POST', body: JSON.stringify(idObject)})
        .then(response => response.json())
            .then((articles) => {
                if (articles.length === 0){
                    let $noMore = $('<div></div>').addClass('no-more');
                    $noMore.text('No more articles to rate.  Check back later!');
                    $printArticleForRating.append($noMore);
                } else {
                    printArticlesForRating(articles, $printArticleForRating, 0);
                }
            }).catch(error => {
                console.log(error);
            })
        }

let getDBArticlesView  = () => {
    $.get('/articles', data => {
        let articles = JSON.parse(data);
        articles.forEach(element => {
            printArticles(element, $printResult);
        })
    })
}

let postRating = (object) => {
    fetch('/ratings', 
        {method: 'POST', body: JSON.stringify(object)})
        .then(response => response.json())
        .then(data => console.log(data));
}

//button functions
let showPageButton = (buttonDom, newViewableDom) => {
    buttonDom.click(function(){
        let visiblePage = document.getElementsByClassName('viewable-on')[0];
        visiblePage.className = 'viewable-off';
        newViewableDom.className = "viewable-on";
    });
};

let renderButtons = () => {
    showPageButton($viewButton, viewArticles);
    $viewButton.click(() => {
        $printResult.empty();
        getDBArticlesView();
    })
    showPageButton($signInButton, signIn);
}
getDBArticlesView();
renderButtons();