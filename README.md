Інтернет-магазин на Flutter
Навчальний Flutter-застосунок для перегляду каталогу товарів. Проєкт реалізовано з використанням принципів Clean Architecture, Provider та Dependency Injection.
Архітектура застосунку
flowchart TD
    P[Presentation: Flutter UI та AppDependencies]
    A[Application: ProductProvider]
    D[Domain: Product та ProductRepository]
    R[Data: ProductRepositoryImpl]
    I[Infrastructure: ProductService]

    P --> A
    A --> D
    P --> R
    R --> D
    R --> I
Призначення шарів
Domain — сутність Product та інтерфейс ProductRepository.
Application — ProductProvider, керування станом каталогу.
Data — ProductRepositoryImpl, реалізація репозиторію.
Infrastructure — ProductService, джерело даних про товари.
Presentation — інтерфейс Flutter та налаштування залежностей через AppDependencies.
Залежності організовані через абстракцію ProductRepository: ProductProvider не залежить безпосередньо від ProductRepositoryImpl.
Встановлення та запуск
Потрібні Flutter SDK, Dart SDK та VS Code або інше середовище розробки.
flutter pub get
flutter run -d chrome
Перевірка коду
flutter analyze
Робота з Git
Розробка виконувалася у feature-гілках з об'єднанням змін через Pull Requests у develop, а потім у main. Тег завершеної версії: v1.0.0.