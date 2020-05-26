const employees_pages_id = document.getElementById('employees-pages-id');
let currentUser;
let database;
let currentDisplayType = 'articles-block-style'

class User {
    constructor(props) {
        this.id = props.u_id;
        this.email = props.u_email;
        this.role = props.role;
        this.firstName_EN = props.u_firstName_EN;
        this.lastName_EN = props.u_lastName_EN;
        this.image = props.u_image;
    }


    renderHeder() {
        const userHeaderID = document.getElementById('user-header')
        let userHeaderHTML = userHeaderID.innerHTML
        let userHeader = ''
        userHeader += userHeaderHTML.replace(/<%image%>/g, currentUser.image)
            .replace(/<%fullNameEN%>/g, getCurrentUserName.apply(currentUser))
        document.getElementById('header-root').innerHTML = userHeader
        document.getElementById('create-article').addEventListener('click', this.createNewArticle)
        document.getElementById('open-chat').addEventListener('click', () => {
            document.getElementById('wiki-chat').classList.remove('chat-hidden')
            addName()
        })
        document.getElementById('wiki-butt-close').addEventListener('click', () => {
            document.getElementById('wiki-chat').classList.add('chat-hidden')
            
        })
        this.canLogOut()
    }

    canLogOut() {
        document.getElementById('log-out').addEventListener('click', logOut)
    }

    buildProfileDOM(targetUser) {
        const sectionLeft = document.getElementById('left');
        const sectionRight = document.getElementById('right');
        const profileTemplateID = document.getElementById('profile-page-template');
        const infoTemplateID = document.getElementById('profile-info-template');
        let profileTemplate = profileTemplateID.innerHTML;
        let infoTemplate = infoTemplateID.innerHTML;
        let profileBody = ''
        let infoBody = ''
        targetUser.forEach(data => {
            profileBody += profileTemplate.replace(/<%img%>/g, data.u_image)
                .replace(/<%gender%>/g, data.u_gender)
                .replace(/<%fullNameEN%>/g, getFullNameEN.apply(data))
                .replace(/<%fullNameRU%>/g, getFullNameRU.apply(data))
                .replace(/<%id%>/g, data.u_id)
        })

        targetUser.forEach(data => {
            infoBody += infoTemplate.replace(/<%img%>/g, data.u_image)
                .replace(/<%department%>/g, data.u_department)
                .replace(/<%room%>/g, data.u_room)
                .replace(/<%internal_phone%>/g, data.u_internal_phone)
                .replace(/<%mobile_phone%>/g, data.u_mobile_phone)
                .replace(/<%email%>/g, data.u_email)
                .replace(/<%skype%>/g, data.u_skype)
                .replace(/<%c_number%>/g, data.u_c_number)
        })

        sectionLeft.innerHTML = profileBody;
        sectionRight.innerHTML = infoBody;
    }

    openProfileInfo(event) {
        const btnType = event.target.dataset.btn
        const id = event.target.dataset.id
        const targetUser = []
        if (btnType === 'profile') {
            for (let i = 0; i < database.length; i++) {
                if (+id === database[i].u_id) {
                    targetUser.push(database[i])
                    currentUser.buildProfileDOM(targetUser)
                }
            }
        }
    }

    buildArticleDOM(targetUser) {

        const sectionLeft = document.getElementById('left');
        const sectionRight = document.getElementById('right');
        const profileTemplateID = document.getElementById('article-page-template');
        const infoTemplateID = document.getElementById('article-info-template');
        let profileTemplate = profileTemplateID.innerHTML;
        let infoTemplate = infoTemplateID.innerHTML;
        let profileBody = ''
        let infoBody = ''
        targetUser.forEach(data => {
            profileBody += profileTemplate.replace(/<%img%>/g, data.a_image)
                .replace(/<%role%>/g, data.role)
                .replace(/<%fullNameEN%>/g, getFullNameEN.apply(data))
                .replace(/<%nickname%>/g, '#' + data.u_nickname)
                .replace(/<%id%>/g, data.u_id)
        })

        targetUser.forEach(data => {
            infoBody += infoTemplate//.replace(/<%img%>/g, data.u_image)
                .replace(/<%category%>/g, data.ac_category_name)
                .replace(/<%subcategory%>/g, data.as_name_subcategory)
                .replace(/<%date%>/g, data.a_date_created)
                .replace(/<%full_name%>/g, data.a_full_name)
                .replace(/<%description_1%>/g, data.a_description_1)
                .replace(/<%description_2%>/g, data.a_description_2)
                .replace(/<%description_3%>/g, data.a_description_3)
                .replace(/<%image%>/g, data.a_image)
            
        })

        sectionLeft.innerHTML = profileBody;
        sectionRight.innerHTML = infoBody;
        document.getElementById('top-article-edit').addEventListener('click', () => this.createEditArticleForm(targetUser))
        document.getElementById('download').addEventListener('click', () => {
            console.log('work')
            var text = "text";
            var csvData = 'data:application/txt;charset=utf-8,' + encodeURIComponent(text);
            this.href = csvData;
            this.target = '_blank';
            this.download = 'txt.txt';
                
        })
    }

    openArticleInfo(event, database) {
        const btnType = event.target.dataset.btn
        const id = event.target.dataset.id
        const targetUser = []
        if (btnType === 'profile') {
            for (let i = 0; i < database.length; i++) {
                if (+id === database[i].a_id) {
                    targetUser.push(database[i])
                    currentUser.buildArticleDOM(targetUser)
                }
            }
        }
    }

    createNewArticle() {
        const sectionLeft = document.getElementById('left');
        const sectionRight = document.getElementById('right');
        const createProfileID = document.getElementById('create-article-profile');
        const createInfoID = document.getElementById('create-article-info');
        let createProfile = createProfileID.innerHTML;
        let createInfo = createInfoID.innerHTML;
        let infoBody = ''
        infoBody += createInfo//.replace(/<%img%>/g, data.u_image)
                .replace(/<%author%>/g, currentUser.id)
                .replace(/<%authorName%>/g, getFullNameEN.apply(currentUser))
        sectionLeft.innerHTML = createProfile;
        sectionRight.innerHTML = infoBody;
        sendDataFromArticleForm()
    }

    createEditArticleForm(targetUser) {
        console.log('qwe')
        const sectionLeft = document.getElementById('left');
        const sectionRight = document.getElementById('right');
        const profileTemplateID = document.getElementById('open-edit-article');
        const infoTemplateID = document.getElementById('open-edit-article-info');
        let profileTemplate = profileTemplateID.innerHTML;
        let infoTemplate = infoTemplateID.innerHTML;
        let profileBody = ''
        let infoBody = ''

        targetUser.forEach(data => {
            profileBody += profileTemplate.replace(/<%image%>/g, data.a_image)
                .replace(/<%id%>/g, data.a_id)
        })
        targetUser.forEach(data => {
            console.log(data)
            infoBody += infoTemplate
                .replace(/<%a_id%>/g, data.a_id)
                .replace(/<%a_name%>/g, data.a_name)
                .replace(/<%a_full_name%>/g, data.a_full_name)
                .replace(/<%a_short_desc%>/g, data.a_short_desc)
        
                .replace(/<%a_description_1%>/g, data.a_description_1)
                .replace(/<%a_description_2%>/g, data.a_description_2)
                .replace(/<%a_description_3%>/g, data.a_description_3)
        })

        sectionLeft.innerHTML = profileBody;
        sectionRight.innerHTML = infoBody;

        editArticleDataFromForm()
    }

 
    
}


class Editor extends User {
    constructor(props) {
        super(props)
    }

    
    buildProfileDOM(targetUser) {
        super.buildProfileDOM(targetUser)
        this.showEditLink(targetUser)
    }

    showEditLink(targetUser) {
        const editTop = document.getElementById('edit-details-top')
        const editBottom = document.getElementById('edit-details-bottom')
        const editLink = document.createElement('a')
        editLink.src = '#'
        editLink.className = 'main-info-edit'
        editLink.textContent = 'Edit Details'
        editLink.dataset.link = 'open-edit-form'


        editTop.append(editLink.cloneNode(true))
        editBottom.append(editLink)
        document.addEventListener('click', (event) => {
            if (event.target.dataset.link === 'open-edit-form') {
                this.createEditForm(targetUser)
            }
        })
    }


    createEditForm(targetUser) {
        const sectionLeft = document.getElementById('left');
        const sectionRight = document.getElementById('right');
        const profileTemplateID = document.getElementById('open-edit-profile');
        const infoTemplateID = document.getElementById('open-edit-info');
        let profileTemplate = profileTemplateID.innerHTML;
        let infoTemplate = infoTemplateID.innerHTML;
        let profileBody = ''
        let infoBody = ''

        targetUser.forEach(data => {
            profileBody += profileTemplate.replace(/<%image%>/g, data.u_image)
                .replace(/<%id%>/g, data.u_id)
        })
        targetUser.forEach(data => {
            console.log(data)
            infoBody += infoTemplate.replace(/<%firstName_EN%>/g, data.u_firstName_EN)
                .replace(/<%lastName_EN%>/g, data.u_lastName_EN)
                .replace(/<%firstName_RU%>/g, data.u_firstName_RU)
                .replace(/<%lastName_RU%>/g, data.u_lastName_RU)
    
                .replace(/<%gender%>/g, data.u_gender)
                .replace(/<%worker_type%>/g, data.u_worker_type)
                .replace(/<%role%>/g, data.role)
                .replace(/<%password%>/g, data.u_password)
                .replace(/<%department%>/g, data.u_department)
                .replace(/<%room%>/g, data.u_room)
                .replace(/<%internal_phone%>/g, data.u_internal_phone)
                .replace(/<%mobile_phone%>/g, data.u_mobile_phone)
                .replace(/<%email%>/g, data.u_email)
                .replace(/<%skype%>/g, data.u_skype)
                .replace(/<%c_number%>/g, data.u_c_number)
        })

        sectionLeft.innerHTML = profileBody;
        sectionRight.innerHTML = infoBody;

        this.editDataFromForm()
    }


    editDataFromForm() {
        const form = document.getElementById('edit-profile-form');

        form.addEventListener('submit', function (event) {
            event.preventDefault();

            let formData = new FormData(this);
            formData = Object.fromEntries(formData);
            fetchData.post('/edit', formData)
            this.reset();
        });

    };


}


class Admin extends Editor {
    constructor(props) {
        super(props)
    }

    renderHeder() {
        const adminHeaderID = document.getElementById('admin-header')
        let adminHeaderHTML = adminHeaderID.innerHTML
        let adminHeader = ''
        adminHeader += adminHeaderHTML.replace(/<%image%>/g, currentUser.image)
            .replace(/<%fullNameEN%>/g, getCurrentUserName.apply(currentUser)) 
        document.getElementById('header-root').innerHTML = adminHeader
        document.getElementById('open-admin').addEventListener('click', () => renderAdminPanel(database))  
        document.getElementById('create-account').addEventListener('click', this.createNewAccount)
        document.getElementById('create-article').addEventListener('click', this.createNewArticle)
        document.getElementById('open-chat').addEventListener('click', () => {
            document.getElementById('wiki-chat').classList.remove('chat-hidden')
            addName()
        })
        document.getElementById('wiki-butt-close').addEventListener('click', () => {
            document.getElementById('wiki-chat').classList.add('chat-hidden')
            
        })
        this.canLogOut()
    }

    createNewAccount() {
        const sectionLeft = document.getElementById('left');
        const sectionRight = document.getElementById('right');
        const createProfileID = document.getElementById('create-user-profile');
        const createInfoID = document.getElementById('create-user-info');
        let createProfile = createProfileID.innerHTML;
        let createInfo = createInfoID.innerHTML;
        sectionLeft.innerHTML = createProfile;
        sectionRight.innerHTML = createInfo;
        sendDataFromForm()
    }

    sendDataFromForm() {
        const form = document.getElementById('create-account-form');

        form.addEventListener('submit', function (event) {
            event.preventDefault();

            let formData = new FormData(this);
            formData = Object.fromEntries(formData);
            fetchData.post('/create', formData)
            this.reset();
        });

    };

    editUserRole(event) {
        const id = event.target.dataset.id
        const role = event.target.dataset.role
        if (role === 'user') {
            fetchData.post('/role', { id, role: 1 })
        }

        if (role === 'editor') {
            fetchData.post('/role', { id, role: 2 })
        }

        if (role === 'admin') {
            fetchData.post('/role', { id, role: 3 })
        }
        document.addEventListener('click', (event) => changeRole(event))
    }
}


const createUser = (user) => {
    if (user.role === 'admin') {
        console.log('work')
        return new Admin(user);
    } else if (user.role === 'editor') {
        return new Editor(user);
    } else return new User(user);
}


const proxy = jsonData => {
    jsonData.forEach(el => el.visible = true)
}

const getCurrentUserName = function () {
    return (`${this.firstName_EN} ${this.lastName_EN}`)
}

const getFullNameEN = function () {
    return (`${this.u_firstName_EN} ${this.u_lastName_EN}`)
}

const getFullNameRU = function () {
    return (`${this.u_firstName_RU} ${this.u_lastName_RU}`)
}





const buildUsersDOM = (jsonData, tmpl = 'block-style') => {
    currentDisplayType = `users-${tmpl}`
    const template = document.getElementById(tmpl);
    templateHtml = template.innerHTML;
    sortDATA = jsonData.filter(el => el.visible)
    employeesPagesBody = ''
    sortDATA.forEach(data => {
        employeesPagesBody += templateHtml.replace(/<%id%>/g, data.u_id)
            .replace(/<%img%>/g, data.u_image)
            .replace(/<%fullNameEN%>/g, getFullNameEN.apply(data))
            .replace(/<%fullNameRU%>/g, getFullNameRU.apply(data))
            .replace(/<%department%>/g, data.u_department)
            .replace(/<%room%>/g, data.u_room)
    })

    employees_pages_id.innerHTML = employeesPagesBody;
}

const buildArticlesDOM = (jsonData, tmpl = 'block-style-articles') => {
    const template = document.getElementById(tmpl);
    templateHtml = template.innerHTML;
    sortDATA = jsonData.filter(el => el.visible)
    employeesPagesBody = ''
    sortDATA.forEach(data => {
        employeesPagesBody += templateHtml.replace(/<%id%>/g, data.a_id)
            .replace(/<%img%>/g, data.a_image)
            // .replace(/<%fullNameEN%>/g, getFullNameEN.apply(data))
            // .replace(/<%fullNameRU%>/g, getFullNameRU.apply(data))
            .replace(/<%title%>/g, data.a_name)
            .replace(/<%author%>/g, `Author: ${getFullNameEN.apply(data)}`)
            .replace(/<%description%>/g, data.a_short_desc)
    })

    employees_pages_id.innerHTML = employeesPagesBody;
}

const buildNewsDOM = (jsonData, tmpl = 'block-style-news') => {
    const template = document.getElementById(tmpl);
    templateHtml = template.innerHTML;
    sortDATA = jsonData.filter(el => el.visible)
    employeesPagesBody = ''
    sortDATA.forEach(data => {
        employeesPagesBody += templateHtml.replace(/<%id%>/g, data.n_id)
            .replace(/<%img%>/g, data.n_image)
            // .replace(/<%fullNameEN%>/g, getFullNameEN.apply(data))
            // .replace(/<%fullNameRU%>/g, getFullNameRU.apply(data))
            .replace(/<%title%>/g, data.n_title)
            .replace(/<%author%>/g, `Author: ${getFullNameEN.apply(data)}`)
            .replace(/<%description%>/g, data.n_description)
    })

    employees_pages_id.innerHTML = employeesPagesBody;
}


const countDisplayUsers = jsonData => {
    const displayCount = jsonData.filter(el => el.visible)
    document.getElementById('employees-count').innerHTML = `${displayCount.length} results displayed`
}

const countDisplayArticles = jsonData => {
    const displayCount = jsonData.filter(el => el.visible)
    document.getElementById('employees-count').innerHTML = `${displayCount.length} results displayed`
}

const countWrapper = (jsonData) => {
    if (currentDisplayType === 'articles-block-style' || currentDisplayType === 'articles-inline-style') {
        countDisplayArticles(jsonData)
    }
    else if (currentDisplayType === 'users-block-style' || currentDisplayType === 'users-inline-style') {
        countDisplayUsers(jsonData)
    }
}


const inputSearch = jsonData => {
    const searchValue = document.getElementById('people-search-input').value.toLowerCase()
    console.log(jsonData)
    jsonData.map(element => {
        return (element.visible = `${element.u_firstName_EN} ${element.u_lastName_EN}
                ${element.u_firstName_RU} ${element.u_lastName_RU}`.toLowerCase().includes(searchValue)
        )
    })

    document.getElementById('display_block').classList.contains('view-type-active-block') ? buildUsersDOM(jsonData, 'block-style') : buildUsersDOM(jsonData, 'inline-style')

}


const displayBlock = jsonData => {
    currentDisplayType = 'users-block-style'
    buildUsersDOM(jsonData, 'block-style')
    document.getElementById('display_block').classList.add('view-type-active-block')
    document.getElementById('display_inline').classList.remove('view-type-active-inline')
}
document.getElementById('display_block').addEventListener('click', displayBlock)


const displayInline = jsonData => {
    currentDisplayType = 'users-inline'
    buildUsersDOM(jsonData, 'inline-style')
    let fragment = document.createDocumentFragment();
    let template = document.getElementById('inline-style-navigation').content
    fragment.appendChild(template.cloneNode(true))
    employees_pages_id.prepend(template)

    document.getElementById('display_inline').classList.add('view-type-active-inline');
    document.getElementById('display_block').classList.remove('view-type-active-block');
}



const renderAdminPanel = (jsonData) => {
    let adminPanelWrapper = document.createElement('section');
    adminPanelWrapper.id = 'admin-panel-wrapper'
    document.getElementById('wrapper').innerHTML = ''

 
    const template = document.getElementById('admin-panel-user');
    templateHtml = template.innerHTML;
    panelHeader = document.getElementById('admin-panel-header')
    panelHeaderHTML = panelHeader.innerHTML
    employeesPagesBody = ''
    panelHeaderResult = ''
    jsonData.forEach(data => { 
        employeesPagesBody += templateHtml.replace(/<%image%>/g, data.u_image)
            .replace(/<%fullNameEN%>/g, getFullNameEN.apply(data))
            .replace(/<%fullNameRU%>/g, getFullNameRU.apply(data))
            .replace(/<%id%>/g, data.u_id)
    
            .replace(/<%employee%>/g, checkRole.call(data, 'u_worker_type', 'user'))
            .replace(/<%hr%>/g, checkRole.call(data, 'u_worker_type', 'hr'))
            .replace(/<%user%>/g, checkRole.call(data, 'role', 'user'))
            .replace(/<%editor%>/g, checkRole.call(data, 'role', 'editor'))
            .replace(/<%admin%>/g, checkRole.call(data, 'role', 'admin'))

    })
   
    panelHeaderResult = panelHeaderHTML.replace(/<%insertUsers%>/g, employeesPagesBody)
    document.getElementById('wrapper').append(adminPanelWrapper)
    adminPanelWrapper.innerHTML = panelHeaderResult
}


const checkRole = function (column, field) {
    if (this[column] === field) {
        return 'user-role-active'
    } else
        return ''
}

const changeRole = (event) => {
    console.log('qwe')
    const idType = event.target.dataset.role
    if (idType === "user" || idType === "editor" || idType === "admin") {
        const id = event.target.dataset.id
        document.getElementById(id).classList.add('user-role-active')
    }
}


const autoLogin = (data) => {
    database = data;
    let key = Object.keys(localStorage);
    const sortedKey = key.filter(item => item.includes('@'))
    if (sortedKey.length < 1) { 
        createLoginForm() 
        document.getElementById('login-form').addEventListener('submit', () => {
            authFormHandler(event, data)
        })
    } else { 
        database = data;
        const user = checkUser(...sortedKey, localStorage.getItem(sortedKey), data)
        currentUser = createUser(...user)
        currentUser.renderHeder()
        console.log(currentUser)
    }
}



const createLoginForm = () => {
    let templateAuth = document.getElementById('template-authorization').content
    document.getElementById('container').prepend(templateAuth)
    const email = document.getElementById('email');
    const password = document.getElementById('password');
    const form = document.getElementById('login-wrapper')

    form.addEventListener('click', (event) => {
        event.stopPropagation()
    })

    function addClick() {
        let parent = this.parentNode.parentNode;
        parent.classList.add("focus");
    }

    function removeClick() {
        let parent = this.parentNode.parentNode;
        if (this.value == "") {
            parent.classList.remove("focus");
        }
    }

    email.addEventListener("focus", addClick);
    email.addEventListener("blur", removeClick);
    password.addEventListener("focus", addClick);
    password.addEventListener("blur", removeClick);

}

const logOut = () => {
    localStorage.clear()
    location.href = 'index.html'
}




const checkUser = (targetEmail, targetPassword, database) => { 
    const findUser = database.filter(el => targetEmail === el.u_email && targetPassword === el.u_password) 
    return findUser
}

const authFormHandler = (event, data) => {
    event.preventDefault()
    const email = event.target.querySelector('#email').value;
    const password = event.target.querySelector('#password').value;
    console.log(email.length)
    if (email.length < 1 || password.length < 1) { 
        console.log('Please enter correct data again')
    } else if (email.length > 1 || password.length > 1) {
        const user = checkUser(email, password, data)  
  
        if (user.length > 0) {
            localStorage.setItem(email, password)
            currentUser = createUser(...user)
            currentUser.renderHeder()
            document.getElementById('login-wrapper').remove()
        } else console.log('This account does not exist')

    } else console.log('This account does not exist')

}


function sendDataFromForm() {
    const form = document.getElementById('create-account-form');

    form.addEventListener('submit', function (event) {
        event.preventDefault();

        let formData = new FormData(this);
        formData = Object.fromEntries(formData);
        fetchData.post('/create', formData)
        this.reset();
    });

};

function sendDataFromArticleForm(){
    const form = document.getElementById('create-article-form');

    form.addEventListener('submit', function (event) {
        event.preventDefault();

        let formData = new FormData(this);
        formData = Object.fromEntries(formData);
        fetchData.post('/create-article', formData)
        this.reset();
    });

};

function editArticleDataFromForm() {
    const form = document.getElementById('edit-article-form');

    form.addEventListener('submit', function (event) {
        event.preventDefault();

        let formData = new FormData(this);
        formData = Object.fromEntries(formData);
        fetchData.post('/edit-article', formData)
        this.reset();
    });

};

document.getElementById('contact-chat-link').addEventListener('click', () => {
    document.getElementById('input-form-chat').classList.remove('chat-hidden')
})

document.getElementById('butt-close').addEventListener('click', () => {
    document.getElementById('input-form-chat').classList.add('chat-hidden')
})

document.getElementById('butt-contact').addEventListener('click', () => {
    console.log(currentUser)
    const contactData = document.getElementById('chat-input').value
    const select = document.getElementById('select-value').value
    fetchData.post('/contact', {
                                data: contactData,
                                status: 2,
                                type: select,
                                user: currentUser.id
                                })
    document.getElementById('chat-input').value = '';
})

const addName = () => {
    document.getElementById('WebChatNameID').value = `${currentUser.firstName_EN} ${currentUser.lastName_EN}`
    document.getElementById('WebChatNameID').classList.add('chat-hidden')
    document.getElementById('WebChatTextID').placeholder = 'Write a message...'
    
}


const usersFunctionsWrapper = (data) => {
    proxy(data)
    autoLogin(data)

    document.getElementById('open-users').addEventListener('click', () => {
        buildUsersDOM(data)
        countWrapper(data)
    })
    document.getElementById('people-search-button').addEventListener('click', () => inputSearch(data))
    document.getElementById('people-search-button').addEventListener('click', () => countDisplayUsers(data))
    document.getElementById('display_block').addEventListener('click', () => displayBlock(data))
    document.getElementById('display_inline').addEventListener('click', () => displayInline(data))

    document.addEventListener('click', (event) => {
        currentUser.openProfileInfo(event)
    })
    

    document.addEventListener('click', (event) => {
        currentUser.editUserRole(event)
    })
}

const contactFunctionsWrapper = (data) => {
    proxy(data)
    
    
    document.getElementById('open-contact').addEventListener('click', () => {
        buildNewsDOM(data)
        countWrapper(data)
    })

    document.addEventListener('click', (event) => {
        currentUser.openArticleInfo(event, data)
    })
}

const newsFunctionsWrapper = (data) => {
    proxy(data)
    
    
    document.getElementById('open-news').addEventListener('click', () => {
        buildNewsDOM(data)
        countWrapper(data)
    })

    document.addEventListener('click', (event) => {
        currentUser.openArticleInfo(event, data)
    })
}

const articleFunctionsWrapper = (data) => {
    proxy(data)
    countWrapper(data)
    buildArticlesDOM(data)
    document.getElementById('open-articles').addEventListener('click', () => {
        buildArticlesDOM(data)
        countWrapper(data)
    })

    document.addEventListener('click', (event) => {
        currentUser.openArticleInfo(event, data)
    })
}

fetchData.get(`/news`)
    .then(contactFunctionsWrapper) 

fetchData.get(`/news`)
    .then(newsFunctionsWrapper) 

fetchData.get(`/users`)
    .then(usersFunctionsWrapper)

fetchData.get(`/articles`)
    .then(articleFunctionsWrapper)  

    