## Модуль **Welcome Screen**
**Назначение модуля**
	Модуль предназначен для отбражения экрана приветстсвия и отображения краткой информации о приложении. Имеет в себе два текстовых поля и кнопку для перехода на RegistrationScreen.

**Структура**
	- WelcomeScreenInteractor: обрабатывает бизнес-логику. Содержит метод, который вызывается при нажатии на кнопку в WlcomeScreenViewController.
	- WelcomeScreenPresenter: определяет метод для презентации экрана RegistrationScreen для экрана WelcomeScreen. Данных для подготовки к отображению нет.
	- WelcomeScreenRouter: Определяет логику маршрутизации для экрана WelcomeScreen. Имеет метод для выполнения перехода на экран RegistrationScreen
	- WelcomeScreenViewController: отвечает за пользовательский интерфейс и обработку пользовательских действий. 

   **Логика**
	1. WelcomeScreenViewController: Пользователь нажимает на кнопку startButton, вызывается метод startButtonTapped, который вызывает метод интерактора startButtonTapped.

	2. WelcomeScreenInteractor: Обрабатывает запрос и вызывает метод презентера presentRegistrationScreen.

	3. WelcomeScreenPresenter: Подготавливает данные и вызывает метод ViewController displayRegistrationScreen.

	4. WelcomeScreenViewController: Использует роутер для навигации на экран RegistrationScreen.

**Подробнее**
	 - Пользователь нажимает на startButton.
	 - WelcomeScreenViewController вызывает interactor?.startButtonTapped().
	 - WelcomeScreenInteractor вызывает presenter?.presentRegistrationScreen().
	 - WelcomeScreenPresenter вызывает viewController?.displayRegistrationScreen().
	 - WelcomeScreenViewController вызывает router.routeToRegistrationScreen().
	 - WelcomeScreenRouter выполняет переход на RegistrationViewController.

	 
## Модуль **Registration Screen**
**Назначение модуля**
	Модуль предназначен для отображения экрана регистрации пользователя в приложении. Имеет одно текстовое поле, два поля ввода логина и пароля, и одну кнопку для перехода на HomePageScreen.

**Структура**
	- RegistrationModels: отвечает за модели данных передаваемых между компонентами VIP цикла
	- RegistrationInteractor: определяет бизнес логику для для экрана Registration Screen. Имеет метод проверки заполненности полей ввода и логику вызова методов либо для перехода на Home page либо вывода сообщения об ошибке.
	- RegistrationPresenter: определяет метод для презентации экрана HomePageScreen или презентации сообщения об ошибке для экрана RegistrationScreen. Данных для подготовки к отображению нет.
	- RegistrationRouter: Определяет логику маршрутизации для экрана RegistrationScreen. Имеет метод для выполнения перехода на экран HomePageScreen
	- RegistrationViewController: отвечает за пользовательский интерфейс  и обработку пользовательских действий.

**Логика**
	1. RegistrationViewController: Пользователь вводит данные и нажимает на кнопку enterButton, вызывается метод enterButtonTapped, который вызывает метод интерактора enterButtonTapped с данными.

	2. RegistrationInteractor: Проверяет данные и вызывает метод презентера presentHomePage или presentAlert в зависимости от результата.

	3. RegistrationPresenter: Подготавливает данные и вызывает метод ViewController displayHomePage или displayAlert.

	4. RegistrationViewController: Использует роутер для навигации на экран HomePageScreen или отображает сообщение об ошибке.

**Подробнее**
	- Пользователь вводит логин и пароль в поля ввода
	- Пользователь нажимает на enterButton.
	- RegistrationViewController вызывает interactor?.enterButtonTapped(request: request).
	- RegistrationInteractor проверяет данные и вызывает presenter?.presentHomePage(response: response) или presenter?.presentAlert(response: response).
	- RegistrationPresenter вызывает viewController?.displayHomePage() или viewController?.displayAlert(viewModel: viewModel).
	- RegistrationViewController использует роутер для навигации на HomePageScreen или отображает сообщение об ошибке.




## Модуль **Home Page Screen**
**Назначение модуля**
	Модуль предназначен для отображения главной страницы приложения. Имеет в себе два блока информации.
	Первый блок содержит текствое поле с именем пользователя, текстовое поле с текущим балансом пользователя, кнопку вызова экрана для изменения текущего баланса пользователя, кнопку перехода на экран с контактами.
	Втрой блок содержит табличный вид с информацией о последних проведенных транзакциях.


<!--**Структура**-->
<!--	- HomePageModels: отвечает за модели данных.-->
<!--	- HomePageInteractor: обрабатывает бизнес-логику.-->
<!--	- HomePagePresenter: форматирует данные для отображения.-->
<!--	- HomePageRouter: отвечает за навигацию и передачу данных.-->
<!--	- ViewController: отвечает за пользовательский интерфейс.-->

<!--**Логика**-->
<!--	1. Пользователь взаимодействует с ViewController.-->
<!--	2. ViewController вызывает метод Interactor для получения данных.-->
<!--	3. Interactor обрабатывает данные и передает их обратно в Presenter.-->
<!--	4. Presenter формирует данные для ViewController.-->
<!--	5. ViewController обновляет интерфейс с новыми данными.-->
   
