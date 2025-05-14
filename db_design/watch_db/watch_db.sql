drop table if exists
	static_page,
	category_catalog,
	watch_sub_category,
	catalog_to_category,
	md_watch_type,
	md_strap_type,
	md_coverage_type,
	md_body_shape,
	md_mechanism_type,
	md_glass_type,
	md_dial_type,
	md_material_type,
	product,
	watch,
	md_watch,
	watch_to_subcategory,
	accessory,
	md_accessory,
	accessory_to_watch,
	md_delivery_type,
	cart,
	product_to_cart,
	md_order_status,
	"order"
cascade;

--###########################################################################

create table static_page (
	static_page_id smallint generated always as identity primary key,
	title varchar(50) not null,
	content text,
	created_at_dtm timestamp default current_timestamp,
	updated_at_dtm timestamp default current_timestamp,
	is_draft bool default false,
	url varchar(200)
);

insert into static_page (title, content, url) values 
	(
		'Каталог часов',
		'Легендарные часы советской марки «Луч»',
		'https://luch-watches.com/6-watches'
	),
	(
		'Категория часов',
		'Все часы поставляются с паспортами ОАО «Минский часовой завод», содержащими дату сборки часов и подтверждающими заводскую гарантию.',
		null
	),
	(
		'Контактная информация',
		'Мы являемся партнёром ОАО «Минский часовой завод» на территории Российской Федерации с 2013 года.',
		'https://luch-watches.com/content/8-contacts'
	),
	(
		'О марке',
		'История часов «Луч» берёт своё начало в 1953 году с основанием в Беларуси «Минского часового завода».',
		'https://luch-watches.com/content/7-o-marke'
	),
	(
		'Оплата и доставка',
		'Оплата — наличными или картами Мир, Visa, MasterCart при получении в пункте выдачи или курьеру.',
		'https://luch-watches.com/content/1-delivery'
	),
	(
		'Оферта',
		'Публичная оферта интернет-магазина "luch-watches.com"',
		'https://luch-watches.com/oferta.pdf'
	),
	(
		'Персональные данные',
		'Политика в отношении обработки персональных данных',
		'https://luch-watches.com/personal-data.pdf'
	),
	(
		'Часы и механизмы',
		'В кварцевых часах для отсчета времени используется электронный генератор, работающий от батарейки.',
		'https://luch-watches.com/content/9-chasy-i-mekhanizmy'
	);

comment on table static_page is 'Нормативно-справочная и общая информация сайта';
comment on column static_page.static_page_id is 'Уникальный идентификатор страницы';
comment on column static_page.title is 'Название страницы';
comment on column static_page.created_at_dtm is 'Дата создания страницы';
comment on column static_page.updated_at_dtm is 'Дата обновления страницы';
comment on column static_page.is_draft is 'Является ли страница черновиком';
comment on column static_page.url is 'Адрес по которому открываться страница';

--###########################################################################

create table category_catalog (
	category_id smallint generated always as identity primary key,
	category_name varchar(150) not null check (length(category_name) >= 4),
	static_page_id smallint references static_page(static_page_id)
);

insert into category_catalog (category_name, static_page_id) values 
	('Мужские часы', 2),
	('Женские часы', 2),
	('Детские часы', null),
	('Настольные часы', null),
	('Ремни для часов Луч', null);

comment on table category_catalog is 'Категория часов по назначению';
comment on column category_catalog.category_id is 'Уникальный идентификатор категории';
comment on column category_catalog.category_name is 'Название категории';
comment on column category_catalog.static_page_id is 'Внешний ключ на справочную инфо';

--###########################################################################

create table watch_sub_category (
	watch_sub_category_id bigint generated always as identity primary key,
	sub_category_name varchar(300) not null check (length(sub_category_name) >= 2),
	sub_category_description text
);

insert into watch_sub_category (sub_category_name, sub_category_description) values 
	('Однострелочные часы', 'Коллекция однострелочник - механические часы с классическим механизмом 1801.1Нсобственного производства.'), -- Мужские часы
	('Часы с обратным ходом', null), -- Мужские часы
	('DOT', null), -- Мужские часы / Женские часы
	('КОЛЛЕКЦИЯ "AVIATOR"', 'Авиатор – это стильная коллекция мужских часов от Минского часового завода Луч с современным дизайном.'), -- Мужские часы
	('КОЛЛЕКЦИЯ "CASUAL"', 'Коллекция Casual - это современная классика с элегантным дизайном и исключительным качеством.'), -- Мужские часы
	('Нюд', 'Что может быть прекраснее цветущих цветов... Часы из новой серии нюд многим придутся по вкусы.'), -- Женские часы
	('Финифть', 'Древнерусская эмаль финифть, своими корнями переносит нас в древнюю Грецию и происходит от слова финифтис - блестящий.'), -- Женские часы
	('Temper', null), -- Женские часы
	('Камни', 'Отличительной чертой этой серии является использование натуральных камней в оформлении часов и ремешков.'), -- Женские часы
	('КОЛЛЕКЦИЯ "РАСПИСНЫЕ УЗОРЫ"', 'Коллекция подчеркивает богатство, красоту и частицу культурного наследия славянских стран.'), -- Женские часы
	('Архивные серии', null), -- Мужские часы / Женские часы
	('Детские часы', null), -- Все типы часов
	('Настольные часы', null); -- Все типы часов
	
comment on table watch_sub_category is 'Подкатегория часов';
comment on column watch_sub_category.watch_sub_category_id is 'Уникальный идентификатор подкатегории';
comment on column watch_sub_category.sub_category_name is 'Название покатегории';
comment on column watch_sub_category.sub_category_description is 'Описание подкатегории';

--###########################################################################

create table catalog_to_category (
	category_id smallint references category_catalog(category_id),
	watch_sub_category_id bigint references watch_sub_category(watch_sub_category_id),
	primary key (category_id, watch_sub_category_id)
);

insert into catalog_to_category (category_id, watch_sub_category_id) values 
	(1, 1), -- Мужские часы / Однострелочные часы
	(1, 2), -- Мужские часы / Часы с обратным ходом
	(1, 3), -- Мужские часы / DOT
	(1, 4), -- Мужские часы / КОЛЛЕКЦИЯ "AVIATOR"
	(1, 5), -- Мужские часы / КОЛЛЕКЦИЯ "CASUAL"
	(1, 10), -- Мужские часы / КОЛЛЕКЦИЯ "РАСПИСНЫЕ УЗОРЫ"
	(2, 3), -- Женские часы / DOT
	(2, 6), -- Женские часы / Нюд
	(2, 7), -- Женские часы / Финифть
	(2, 8), -- Женские часы / Temper
	(2, 9), -- Женские часы / Камни
	(2, 10), -- Женские часы / КОЛЛЕКЦИЯ "РАСПИСНЫЕ УЗОРЫ"
	(1, 11), -- Мужские часы / Архивные серии
	(2, 11), -- Женские часы / Архивные серии
	(3, 12), -- Детские часы / Детские часы
	(4, 13); -- Настольные часы / Настольные часы

comment on table catalog_to_category is 'Промежуточная таблица для связи категории и подкатегории часов';
comment on column catalog_to_category.category_id is 'Внешний ключ на идентификатор категории из каталога';
comment on column catalog_to_category.watch_sub_category_id is 'Внешний ключ на идентификатор подкатегории часов';

--###########################################################################

create table md_watch_type (
	watch_type_id smallint generated always as identity primary key,
	type_name varchar(150) not null check (length(type_name) >= 4)
);

insert into md_watch_type (type_name) values 
	('детские'),
	('женские'),
	('карманные'),
	('мужские'),
	('настольные'),
	('унисекс');

comment on table md_watch_type is 'Справочная инфо по типу часов';
comment on column md_watch_type.watch_type_id is 'Уникальный идентификатор типа часов';
comment on column md_watch_type.type_name is 'Название типа часов';

--###########################################################################

create table md_strap_type(
	strap_type_id smallint generated always as identity primary key,
	strap_name varchar(150) not null check (length(strap_name) >= 4),
	strap_description text
);

insert into md_strap_type (strap_name, strap_description) values 
	('браслет', 'Часы на браслете'),
	('войлок', null),
	('кожанный ремень', 'Часы на ремне'),
	('нейлоновый ремень', null),
	('резиновый ремень', null);

comment on table md_strap_type is 'Справочная инфо по типу ремешка часов';
comment on column md_strap_type.strap_type_id is 'Уникальный идентификатор ремешка часов';
comment on column md_strap_type.strap_name is 'Название ремешка часов';
comment on column md_strap_type.strap_description is 'Краткое описание ремешка часов';

--###########################################################################

create table md_coverage_type (
	coverage_type_id smallint generated always as identity primary key,
	coverage_name varchar(150) not null check (length(coverage_name) >= 4),
	coverage_description text
);

insert into md_coverage_type (coverage_name, coverage_description) values 
	('алмазоподобное напыление', 'Покрытие: алмазоподобное напыление черное'),
	('декоративное', 'Декоративное покрытие'),
	('дерево', null),
	('керамика', null),
	('нержавеющая сталь', 'Покрытие: нержавеющая сталь'),
	('нитрид титана', 'Покрытие: нитрид титана'),
	('нитрид циркония', 'Покрытие: нитрид циркония'),
	('пластмасса', 'Покрытие: пластмасса'),
	('твердое золото', 'Покрытие: твердое золото'),
	('чернёный хром', null);

comment on table md_coverage_type is 'Справочная инфо по типу покрытия корпуса часов';
comment on column md_coverage_type.coverage_type_id is 'Уникальный идентификатор покрытия корпуса часов';
comment on column md_coverage_type.coverage_name is 'Название покрытия корпуса часов';
comment on column md_coverage_type.coverage_description is 'Краткое описание покрытия корпуса часов';

--###########################################################################

create table md_body_shape (
	body_shape_id smallint generated always as identity primary key,
	body_shape_name varchar(150) not null check (length(body_shape_name) >= 3)
);

insert into md_body_shape (body_shape_name) values 
	('бочка'),
	('круглая'),
	('овальная'),
	('прямоугольная'),
	('фигурная');

comment on table md_body_shape is 'Справочная инфо по типу формы корпуса часов';
comment on column md_body_shape.body_shape_id is 'Уникальный идентификатор формы корпуса часов';
comment on column md_body_shape.body_shape_name is 'Название формы корпуса часов';

--###########################################################################

create table md_mechanism_type (
	mechanism_type_id smallint generated always as identity primary key,
	mechanism_name varchar(150) not null check (length(mechanism_name) >= 4),
	mechanism_description text
);

insert into md_mechanism_type (mechanism_name, mechanism_description) values 
	('кварцевые', 'Кварцевый механизм'),
	('механические', 'Механический ход');

comment on table md_mechanism_type is 'Справочная инфо по типу механизма часов';
comment on column md_mechanism_type.mechanism_type_id is 'Уникальный идентификатор механизма часов';
comment on column md_mechanism_type.mechanism_name is 'Название механизма часов';
comment on column md_mechanism_type.mechanism_description is 'Краткое описание механизма часов';

--###########################################################################

create table md_glass_type (
	glass_type_id smallint generated always as identity primary key,
	glass_name varchar(150) not null check (length(glass_name) >= 4),
	glass_description text
);

insert into md_glass_type (glass_name, glass_description) values 
	('минеральное', 'Минеральное стекло'),
	('органическое', 'Органическое стекло'),
	('сапфировое', 'Сапфировое стекло'),
	('силикатное', null),
	('тонированное', null);

comment on table md_glass_type is 'Справочная инфо по типу стекла часов';
comment on column md_glass_type.glass_type_id is 'Уникальный идентификатор стекла часов';
comment on column md_glass_type.glass_name is 'Название стекла часов';
comment on column md_glass_type.glass_description is 'Краткое описание часов';

--###########################################################################

create table md_dial_type (
	dial_type_id smallint generated always as identity primary key,
	dial_name varchar(150) not null check (length(dial_name) >= 4)
);

insert into md_dial_type (dial_name) values 
	('арабские цифры'),
	('армянские цифры'),
	('без обозначения'),
	('для умных'),
	('римские цифры'),
	('часовые знаки'),
	('частичная');

comment on table md_dial_type is 'Справочная инфо по типy обозначения циферблата часов';
comment on column md_dial_type.dial_type_id is 'Уникальный идентификатор циферблата часов';
comment on column md_dial_type.dial_name is 'Название циферблата часов';

--###########################################################################

create table md_material_type (
	material_type_id smallint generated always as identity primary key,
	material_name varchar(150) not null check (length(material_name) >= 4)
);

insert into md_material_type (material_name) values 
	('Материал корпуса нержавеющая сталь'),
	('Натуральная кожа');

comment on table md_material_type is 'Справочная инфо по типy материала корпуса часов';
comment on column md_material_type.material_type_id is 'Уникальный идентификатор материала корпуса часов';
comment on column md_material_type.material_name is 'Название материала корпуса часов';

--###########################################################################

create table product (
	product_id bigint generated always as identity primary key,
	article varchar(150),
	name varchar(300) not null check (length(name) >= 4),
	price numeric check (price > 0 or price is null) default null
);

insert into product (
	article, name, price) values 
	(
		'71950281',
		'Часы Луч "Однострелочник Ретро"', --name, https://luch-watches.com/muzhskie-chasy/1145-model-77471760.html
		14990 --price
	),
	(
		'571950763',
		'Часы Луч', --name, https://luch-watches.com/muzhskie-chasy/1134-chasy-luch-377477761.html
		12990 --price
	),
	(
		'72087604',
		'Часы Луч "Галактика"', --name, https://luch-watches.com/home/1236-chasy-luch-272081646.html
		10990 --price
	),
	(
		'78447326',
		'Часы Луч', --name, https://luch-watches.com/muzhskie-chasy/1084-chasy-luch-78447326.html
		9990 --price
	),
	(
		'740280594',
		'Часы Луч', --name, https://luch-watches.com/home/979-chasy-luch-740280594.html
		23990 --price
	),
	(
		'71657550',
		'Часы Луч', --name, https://luch-watches.com/home/1182-chasy-luch-71650809.html
		14490 --price
	),
	(
		'38991188',
		'Часы Луч', --name, https://luch-watches.com/arkhivnye-serii/87-model-38991188.html
		4100 --price
	),	
	(
		'75231288',
		'Часы луч', --name, https://luch-watches.com/nyud/650-model-375231288.htmll
		9990 --price
	),
	(
		'9319162',
		'Часы Луч', --name, https://luch-watches.com/zhenskie-chasy/1115-chasy-luch-8319631.html
		7490 --price
	),	
	(
		'78557506',
		'Часы Луч TEMPER', --name, https://luch-watches.com/temper/1102-chasy-luch-temper-378558507.html
		10490 --price
	),	
	(
		'8329632',
		'Часы луч', --name, https://luch-watches.com/kamni/854-model-8329632.html
		6990 --price
	),	
	(
		'71657716',
		'Часы Луч', --name, https://luch-watches.com/kollekciya-raspisnye-uzory/1203-chasy-luch-71650809.html
		14590 --price
	),	
	(
		'73710355',
		'Часы луч', --name, https://luch-watches.com/home/1066-chasy-luch-73711355.html
		6990 --price
	),	
	(
		'2687656',
		'Будильник Луч', --name, https://luch-watches.com/nastolnye-chasy/1177-chasy-luch-429807464.html
		1690 --price
	),
	(
		'5552032', --id 15
		'Ремень Луч', --name, https://luch-watches.com/home/1218-remen-luch-chyornyj-20mm.html
		2500 --price
	),
	(
		'5552033', --id 16
		'Ремень Луч', --name, https://luch-watches.com/home/1046-remen-luch-chyornyj-20mm.html
		2000 --price
	),
	(
		'8881803', --id 17
		'Браслет для часов Луч', --name, https://luch-watches.com/remni-dlya-chasov-luch/1226-braslet-dlya-chasov-luch-888201.html
		1500 --price
	),
	(
		null, --id 18
		'Черный ремень 20мм нейлон', --name, https://luch-watches.com/home/1036-chernyj-remen-20mm-nejlon.html
		1200 --price
	);

comment on table product is 'Базовая таблица товаров';
comment on column product.product_id is 'Уникальный идентификатор товара';
comment on column product.article is 'Артикул товара';
comment on column product.name is 'Название товара';
comment on column product.price is 'Стоимость товара с НДС';

--###########################################################################

create table watch (
	product_id bigint references product(product_id) primary key,
	watch_type_id smallint references md_watch_type(watch_type_id),
	mechanism_type_id smallint references md_mechanism_type(mechanism_type_id),
	glass_type_id smallint references md_glass_type(glass_type_id),
	dial_type_id smallint references md_dial_type(dial_type_id),
	body_shape_id smallint references md_body_shape(body_shape_id),
	strap_type_id smallint references md_strap_type(strap_type_id),
	coverage_type_id smallint references md_coverage_type(coverage_type_id),
	material_type_id smallint references md_material_type(material_type_id),
	other_options jsonb default null,
	icon_link varchar(300),
	body_diametr numeric default null,
	in_stock bool not null default false
);

insert into watch (
	product_id, watch_type_id, mechanism_type_id, glass_type_id, dial_type_id, body_shape_id, strap_type_id,
	coverage_type_id, material_type_id, other_options, icon_link, body_diametr, in_stock) values 
	(
		1, --product_id
		4, --watch_type_id (мужские)
		2, --mechanism_type_id (механические)
		1, --glass_type_id (Минеральное стекло)
		1, --dial_type_id (арабские цифры)
		2, --body_shape_id (круглая)
		3, --strap_type_id (кожанный ремень / Часы на ремне)
		5, --coverage_type_id (нержавеющая сталь)
		1, --material_type_id
		'{"auto_winding": false, "calendar": false, "waterproof": true, "precious_metals": false}', --other_options
		'https://luch-watches.com/5915-large_default/model-77471760.jpg', --icon_link
		37.6, --body_diametr
		true --in_stock
	),
	(
		2, --product_id
		4, --watch_type_id (мужские)
		2, --mechanism_type_id (механические)
		1, --glass_type_id (Минеральное стекло)
		1, --dial_type_id (арабские цифры)
		2, --body_shape_id (круглая)
		1, --strap_type_id (браслет)
		5, --coverage_type_id (нержавеющая сталь)
		1, --material_type_id (нержавеющая сталь)
		'{"auto_winding": false, "calendar": false, "waterproof": true, "precious_metals": false}', --other_options
		'https://luch-watches.com/4228-large_default/chasy-luch-377477761.jpg', --icon_link
		37.6, --body_diametr
		true --in_stock
	),
	(
		3, --product_id
		4, --watch_type_id (мужские)
		1, --mechanism_type_id (кварцевые)
		1, --glass_type_id (Минеральное стекло)
		1, --dial_type_id (арабские цифры)
		2, --body_shape_id (круглая)
		3, --strap_type_id (кожанный ремень / Часы на ремне)
		1, 	--coverage_type_id (алмазоподобное напыление / Покрытие: алмазоподобное напыление черное)
		1, --material_type_id (нержавеющая сталь)
		'{"auto_winding": false, "calendar": false, "waterproof": true, "precious_metals": false}', --other_options
		'https://luch-watches.com/6144-large_default/chasy-luch-272081646.jpg', --icon_link
		40.4, --body_diametr
		true --in_stock
	),
	(
		4, --product_id
		6, --watch_type_id (унисекс)
		1, --mechanism_type_id (кварцевые)
		1, --glass_type_id (Минеральное стекло)
		1, --dial_type_id (арабские цифры)
		2, --body_shape_id (круглая)
		3, --strap_type_id (кожанный ремень / Часы на ремне)
		1, 	--coverage_type_id (алмазоподобное напыление / Покрытие: алмазоподобное напыление черное)
		1, --material_type_id (нержавеющая сталь)
		'{"auto_winding": false, "calendar": false, "waterproof": true, "precious_metals": false}', --other_options
		'https://luch-watches.com/6144-large_default/chasy-luch-272081646.jpg', --icon_link
		37.6, --body_diametr
		true --in_stock
	),
	(
		5, --product_id
		4, --watch_type_id (мужские)
		1, --mechanism_type_id (кварцевые)
		3, --glass_type_id (Сапфировое стекло)
		1, --dial_type_id (арабские цифры)
		2, --body_shape_id (круглая)
		3, --strap_type_id (кожанный ремень / Часы на ремне)
		5, 	--coverage_type_id (нержавеющая сталь)
		1, --material_type_id (нержавеющая сталь)
		'{"auto_winding": false, "calendar": true, "waterproof": true, "precious_metals": false}', --other_options
		'https://luch-watches.com/2681-large_default/chasy-luch-740280594.jpg', --icon_link
		null, --body_diametr
		true --in_stock
	),
	(
		6, --product_id
		4, --watch_type_id (мужские)
		1, --mechanism_type_id (кварцевые)
		3, --glass_type_id (Сапфировое стекло)
		1, --dial_type_id (арабские цифры)
		2, --body_shape_id (круглая)
		3, --strap_type_id (кожанный ремень / Часы на ремне)
		2, 	--coverage_type_id (Декоративное покрытие)
		1, --material_type_id (нержавеющая сталь)
		'{"auto_winding": false, "calendar": false, "waterproof": false, "precious_metals": false}', --other_options
		'https://luch-watches.com/5147-large_default/chasy-luch-71650809.jpg', --icon_link
		37.6, --body_diametr
		true --in_stock
	),
	(
		7, --product_id
		2, --watch_type_id (женские)
		1, --mechanism_type_id (кварцевые)
		1, --glass_type_id (Минеральное стекло)
		7, --dial_type_id (частичная)
		4, --body_shape_id (прямоугольная)
		3, --strap_type_id (кожанный ремень / Часы на ремне)
		5, 	--coverage_type_id (нержавеющая сталь)
		1, --material_type_id (нержавеющая сталь)
		'{"auto_winding": false, "calendar": false, "waterproof": false, "precious_metals": false}', --other_options
		'https://luch-watches.com/130-large_default/model-38991188.jpg', --icon_link
		null, --body_diametr
		false --in_stock
	),	
	(
		8, --product_id
		2, --watch_type_id (женские)
		2, --mechanism_type_id (механические)
		1, --glass_type_id (Минеральное стекло)
		3, --dial_type_id (часовые знаки)
		2, --body_shape_id (круглая)
		3, --strap_type_id (кожанный ремень / Часы на ремне)
		5, 	--coverage_type_id (нержавеющая сталь)
		1, --material_type_id (нержавеющая сталь)
		'{"auto_winding": false, "calendar": false, "waterproof": false, "precious_metals": false}', --other_options
		'https://luch-watches.com/2053-large_default/model-375231288', --icon_link
		null, --body_diametr
		true --in_stock
	),	
	(
		9, --product_id
		2, --watch_type_id (женские)
		2, --mechanism_type_id (механические)
		2, --glass_type_id (Органическое стекло)
		3, --dial_type_id (без обозначения)
		3, --body_shape_id (овальная)
		1, --strap_type_id (браслет / Часы на браслете)
		6, 	--coverage_type_id (нитрид титана)
		1, --material_type_id (нержавеющая сталь)
		'{"auto_winding": false, "calendar": false, "waterproof": false, "precious_metals": false}', --other_options
		'https://luch-watches.com/3873-large_default/chasy-luch-8319631.jpg', --icon_link
		null, --body_diametr
		true --in_stock
	),	
	(
		10, --product_id
		2, --watch_type_id (женские)
		1, --mechanism_type_id (кварцевые)
		1, --glass_type_id (Минеральное стекло)
		1, --dial_type_id (арабские цифры)
		2, --body_shape_id (круглая)
		1, --strap_type_id (браслет / Часы на браслете)
		2, 	--coverage_type_id (Декоративное покрытие)
		1, --material_type_id (нержавеющая сталь)
		'{"auto_winding": false, "calendar": false, "waterproof": true, "precious_metals": true}', --other_options
		'https://luch-watches.com/3707-large_default/chasy-luch-temper-378558507.jpg', --icon_link
		31, --body_diametr
		true --in_stock
	),	
	(
		11, --product_id
		2, --watch_type_id (женские)
		2, --mechanism_type_id (механические)
		null, --glass_type_id
		3, --dial_type_id (без обозначения)
		3, --body_shape_id (овальная)
		1, --strap_type_id (браслет / Часы на браслете)
		6, 	--coverage_type_id (нитрид титана)
		1, --material_type_id (нержавеющая сталь)
		'{"auto_winding": false, "calendar": false, "waterproof": false, "precious_metals": false}', --other_options
		'https://luch-watches.com/4359-large_default/model-8329632.jpg', --icon_link
		null, --body_diametr
		true --in_stock
	),	
	(
		12, --product_id
		4, --watch_type_id (мужские)
		1, --mechanism_type_id (кварцевые)
		3, --glass_type_id (Сапфировое стекло)
		3, --dial_type_id (без обозначения)
		2, --body_shape_id (круглая)
		3, --strap_type_id (кожанный ремень / Часы на ремне)
		5, --coverage_type_id (нержавеющая сталь)
		1, --material_type_id (нержавеющая сталь)
		'{"auto_winding": false, "calendar": false, "waterproof": true, "precious_metals": false}', --other_options
		'https://luch-watches.com/5518-large_default/chasy-luch-71650809.jpg', --icon_link
		37.6, --body_diametr
		true --in_stock
	),	
	(
		13, --product_id
		1, --watch_type_id (детские)
		1, --mechanism_type_id (кварцевые)
		1, --glass_type_id (Минеральное стекло)
		1, --dial_type_id (арабские цифры)
		2, --body_shape_id (круглая)
		3, --strap_type_id (кожанный ремень / Часы на ремне)
		null, --coverage_type_id
		1, --material_type_id (нержавеющая сталь)
		'{"auto_winding": false, "calendar": false, "waterproof": false, "precious_metals": false}', --other_options
		'https://luch-watches.com/4921-large_default/chasy-luch-73711355.jpgg', --icon_link
		null, --body_diametr
		true --in_stock
	),	
	(
		14, --product_id
		5, --watch_type_id (настольные)
		1, --mechanism_type_id (кварцевые)
		1, --glass_type_id (Минеральное стекло)
		1, --dial_type_id (арабские цифры)
		2, --body_shape_id (круглая)
		null, --strap_type_id
		2, 	--coverage_type_id (Декоративное покрытие)
		1, --material_type_id (нержавеющая сталь)
		'{"auto_winding": false, "calendar": false, "waterproof": false, "precious_metals": false}', --other_options
		'https://luch-watches.com/5050-large_default/chasy-luch-429807464.jpg', --icon_link
		null, --body_diametr
		true --in_stock
	);

comment on table watch is 'Таблица с параметрами часов';
comment on column watch.product_id is 'Уникальный идентификатор часов';
comment on column watch.watch_type_id is 'Идентификатор типа часов';
comment on column watch.mechanism_type_id is 'Идентификатор механизма часов';
comment on column watch.glass_type_id is 'Идентификатор стекла часов';
comment on column watch.dial_type_id is 'Идентификатор типа циферблата';
comment on column watch.body_shape_id is 'Идентификатор формы корпуса часов';
comment on column watch.strap_type_id is 'Идентификатор типа ремешка';
comment on column watch.coverage_type_id is 'Идентификатор типа покрытия часов';
comment on column watch.material_type_id is 'Идентификатор типа материала часов';
comment on column watch.other_options is 'Другие опции часов (защита от влаги, календарь, автоподзавод, драг. металы)';
comment on column watch.icon_link is 'Ссылка на картинку часов';
comment on column watch.body_diametr is 'Диаметр корпуса часов';
comment on column watch.in_stock is 'Наличие часов на складе';

--###########################################################################

create table md_watch (
	product_id bigint primary key references watch(product_id),
	description text,
	video_link varchar(300),
	photos_link varchar(300)
);

insert into md_watch (product_id, description, video_link, photos_link) values 
	(
		1,
		'Часы Луч "Однострелочник Ретро" 71950280- это часы из лимитированной серии, выпущенные в ретро стиле.',
		'https://pic.rutube.ru/video/2024-09-19/12/56/1256950e2bb9992335397d639b246870',
		'https://luch-watches.com/4417-luch_large_for_product_page/model-77471760'
	),
	(
		2,
		'Часы Луч 571950763- это классический однострелочник в новом исполнении, корпус шириной 37,6 мм теперь выполнен из нержавеющей стали.',
		'https://pic.rutube.ru/video/2024-09-19/59/b4/59b4f2aedcb3f9a7e56c83b457090aeb',
		'https://luch-watches.com/4222-luch_large_for_product_page/chasy-luch-377477761'
	),
	(
		3,
		'Наручные часы Луч "Галактика" 72087604 продолжают космическую тематику в часах, удивляя реализмом космических явлений и объектов.',
		'https://pic.rutube.ru/video/2024-09-24/bd/55/bd5530b4a1a13465be4de890f9b3f323',
		'https://luch-watches.com/6027-luch_prod_page_small_btt/chasy-luch-272081646'
	),
	(
		4,
		'Часы Луч 778449326 из коллекции DOT радуют современным дизайном.',
		'https://pic.rutube.ru/video/2024-09-19/ff/02/ff025e781169e1053e9284126685cea3',
		'https://luch-watches.com/5581-large_default/chasy-luch-78447326'
	),
	(
		5,
		'Мужской хронограф авиатор ЛУЧ 740280594 с тёмно серым цифирблатом. Классический формат авиатора.',
		'https://pic.rutube.ru/video/2024-09-19/28/88/28880c0e1093962c4cd43ea07cda3c55',
		'https://luch-watches.com/2741-luch_prod_page_small_btt/chasy-luch-740280594'
	),
	(
		6,
		'Часы Луч 71657550 - это современная классика с элегантным дизайном и исключительным качеством.',
		'https://i.ytimg.com/vi/yFa2Sua8Cj',
		'https://luch-watches.com/5134-luch_large_for_product_page/chasy-luch-71650809'
	),
	(
		7,
		'Эти модные часы Луч 38991188 отличаются одновременно достаточно строгим, но при этом оригинальным дизайном.',
		'https://i.ytimg.com/vi_webp/vdzqaO2i5GM/',
		'https://luch-watches.com/318-luch_prod_page_small_btt/model-38991188'
	),
	(
		8,
		'Часы серии нюд 75237288 это современный часы в минималистичном стиле. Ремешок нежно серого цвета.',
		'https://pic.rutube.ru/video/2024-09-19/dd/72/dd72e6d744c734b82e1f8500dd8718ca',
		'https://luch-watches.com/nyud/650-model-375231288'
	),
	(
		9,
		'Женские часы Луч 9319162- это уникальные часы с финифтью. Корпус из латуни, покрыт нитридом титана.',
		null,
		'https://luch-watches.com/3874-luch_prod_page_small_btt/chasy-luch-8319631'
	),
	(
		10,
		'Эффектные женские часы, элегантные и броские. Корпус выполнен из нержавеющей стали и покрыт гипоаллергенным декоративным покрытием.',
		'https://pic.rutube.ru/video/2024-09-19/4f/8d/4f8dba00332773f11728716623515ff7',
		'https://luch-watches.com/3710-luch_prod_page_small_btt/chasy-luch-temper-378558507'
	),
	(
		11,
		'Изящные наручные женские механические часы Луч 8329632 на браслете с натуральными камнями.',
		null,
		'https://luch-watches.com/4364-luch_prod_page_small_btt/model-8329632'
	),
	(
		12,
		'Часы Луч 71657716 - это модель из новой коллекции  "Расписные узоры". Дизайнеров вдохновила ХОХЛОМСКАЯ роспись- декоративная роспись.',
		null,
		'https://luch-watches.com/5519-luch_prod_page_small_btt/chasy-luch-71650809'
	),
	(
		13,
		'Модель 73710355 из детской коллекция «New kids» создана для самых любознательных, мечтательных и активных детишек.',
		'https://pic.rutube.ru/video/2024-09-19/c3/65/c3656bb5df2f439ad9f5c2355a61cdf5',
		'https://luch-watches.com/4985-luch_prod_page_small_btt/chasy-luch-73711355'
	),
	(
		14,
		'Стильный ретро будильник от Минского часового завода "Луч", несомненно, будет изюминкой вашего интерьера.',
		null,
		'https://luch-watches.com/5043-luch_prod_page_small_btt/chasy-luch-429807464'
	);

comment on table md_watch is 'Дополнительная информация по часам';
comment on column md_watch.product_id is 'Уникальный идентификатор часов';
comment on column md_watch.description is 'Описание часов';
comment on column md_watch.video_link is 'Ссылка на видеообзор часов';
comment on column md_watch.photos_link is 'Ссылка на фотографии часов';

--###########################################################################

create table watch_to_subcategory (
	product_id bigint references watch(product_id),
	watch_sub_category_id bigint references watch_sub_category(watch_sub_category_id),
	primary key (product_id, watch_sub_category_id)
);

insert into watch_to_subcategory (product_id, watch_sub_category_id) values 
	(1, 1), -- Часы Луч "Однострелочник Ретро" 71950281 / Однострелочные часы
	(2, 1), -- Часы Луч 571950763 / Однострелочные часы
	(3, 2), -- Часы Луч "Галактика" 72087604 / Часы с обратным ходом
	(4, 3), -- Часы Луч 78447326 / DOT
	(5, 4), -- Часы Луч 740280594 / КОЛЛЕКЦИЯ "AVIATOR"
	(6, 5), -- Часы Луч 71657550 / КОЛЛЕКЦИЯ "CASUAL"
	(7, 11), -- Часы Луч 38991188 / DOT
	(8, 6), -- Часы луч 75231288 / Нюд
	(9, 7), -- Часы Луч 9319162 / Финифть
	(10, 8), -- Часы Луч TEMPER 78557506 / Temper
	(11, 9), -- Часы луч 8329632 / Камни
	(12, 10), -- Часы Луч 71657716 / КОЛЛЕКЦИЯ "РАСПИСНЫЕ УЗОРЫ"
	(13, 12), -- Часы луч 73710355 / Детские часы
	(14, 13); -- Будильник Луч 2687656 / Настольные часы

comment on table watch_to_subcategory is 'Промежуточная таблица для связи подкатегории часов с часами';
comment on column watch_to_subcategory.product_id is 'Внешний ключ на идентификатор часов';
comment on column watch_to_subcategory.watch_sub_category_id is 'Внешний ключ на идентификатор подкатегории часов';

--###########################################################################

create table accessory (
	product_id bigint references product(product_id) primary key,
	material_type_id smallint references md_material_type(material_type_id),
	icon_link varchar(300),
	in_stock bool not null default false
);

insert into accessory (product_id, material_type_id, icon_link, in_stock) values 
	(
		15, --product_id
		2, --material_type_id (натуральная кожа)
		'https://luch-watches.com/5773-large_default/remen-luch-chyornyj-20mm.jpg', --icon_link
		true --in_stock
	),
	(
		16, --product_id
		2, --material_type_id (натуральная кожа)
		'https://luch-watches.com/4705-large_default/remen-luch-chyornyj-20mm.jpg', --icon_link
		true --in_stock
	),
	(
		17, --product_id
		1, --material_type_id (нержавеющая сталь)
		'https://luch-watches.com/5927-large_default/braslet-dlya-chasov-luch-888201.jpg', --icon_link
		true --in_stock
	),
	(
		18, --product_id
		null, --material_type_id
		'https://luch-watches.com/3171-luch_large_for_product_page/chernyj-remen-20mm-nejlon.jpg', --icon_link
		true --in_stock
	);

comment on table accessory is 'Таблица с ремешками для часов';
comment on column accessory.product_id is 'Уникальный идентификатор ремешка';
comment on column accessory.material_type_id is 'Идентификатор типа материала ремешка';
comment on column accessory.icon_link is 'Ссылка на картинку ремешка';
comment on column accessory.in_stock is 'Наличие ремешка на складе';

--###########################################################################

create table md_accessory (
	product_id bigint references product(product_id) primary key,
	description text,
	photos_link varchar(300)
);

insert into md_accessory (product_id, description, photos_link) values 
	(
		15,
		'Фирменный ремень "Луч" шириной 20 мм рыжего цвета со стильной чёрной строчкой. Выполнен из натуральной кожи.',
		'https://luch-watches.com/5780-luch_large_for_product_page/remen-luch-chyornyj-20mm.jpg'
	),
	(
		16,
		'Фирменный ремень "Луч" шириной 20 мм чёрного цвета с белой строчкой. Выполнен из натуральной кожи.',
		'https://luch-watches.com/4155-luch_prod_page_small_btt/remen-luch-chyornyj-20mm.jpg'
	),
	(
		17,
		'Браслет Миланское плетение для часов Луч состоит из мелких звеньев. Сделан из нержавеющей стали.',
		'https://luch-watches.com/5922-luch_prod_page_small_btt/braslet-dlya-chasov-luch-888201.jpg'
	),
	(
		18,
		null,
		'https://luch-watches.com/3171-luch_large_for_product_page/chernyj-remen-20mm-nejlon.jpg'
	);

comment on table md_accessory is 'Дополнительная информация по ремешкам';
comment on column md_accessory.product_id is 'Уникальный идентификатор ремешка';
comment on column md_accessory.description is 'Описание ремешка';
comment on column md_accessory.photos_link is 'Ссылка на фотографии ремешка';

--###########################################################################

create table accessory_to_watch (
	product_id bigint references accessory(product_id),
	watch_sub_category_id bigint references watch_sub_category(watch_sub_category_id),
	primary key (product_id, watch_sub_category_id)
);

insert into accessory_to_watch (product_id, watch_sub_category_id) values
	(15, 1), -- Ремень Луч 5552032 / Однострелочные часы
	(15, 3), -- Ремень Луч 5552032 / DOT
	(17, 2), -- Браслет для часов Луч 8881803 / Часы с обратным ходом
	(17, 6); -- Браслет для часов Луч 8881803 / Нюд

comment on table accessory_to_watch is 'Промежуточная таблица для связи подкатегории часов с ремешками';
comment on column accessory_to_watch.product_id is 'Внешний ключ на идентификатор ремешка';
comment on column accessory_to_watch.watch_sub_category_id is 'Внешний ключ на идентификатор подкатегории часов';

--###########################################################################

create table md_delivery_type (
	delivery_type_id smallint generated always as identity primary key,
	delivery_name varchar(300) not null,
	delivery_description text,
	delivery_cost text
);

insert into md_delivery_type (delivery_name, delivery_description, delivery_cost) values 
	('boxberry', 'Доставка до пункта самовывоза', 'Бесплатно!'),
	('Почта россии', 'Доставка почтой России', 'Бесплатно!'),
	('Курьер', 'Курьерская доставка по Москве', 'от 199 р.');

comment on table md_delivery_type is 'Доступные типы доставки';
comment on column md_delivery_type.delivery_type_id is 'Уникальный идентификатор доставки';
comment on column md_delivery_type.delivery_name is 'Наименование доставки';
comment on column md_delivery_type.delivery_description is 'Описание сервиса доставки';
comment on column md_delivery_type.delivery_cost is 'Стоимость доставки';

--###########################################################################

create table cart (
	cart_id bigint generated always as identity primary key,
	first_name varchar(50),
	last_name varchar(50),
	address varchar(300),
	phone varchar(20),
	email varchar(50),
	comment text,
	delivery_type_id smallint references md_delivery_type(delivery_type_id),
	user_cookies_hash varchar(64) not null check (length(user_cookies_hash) = 64)
);

insert into cart (first_name, last_name, address, phone, email, comment, delivery_type_id, user_cookies_hash) values
	(null, null, null, null, null, 'Предварительно позвонить', 2, 'aec070645fe53ee3b3763059376134f058cc337247c978add178b6ccdfb0019f'),
	(null, null, null, null, 'anna2000@mail.ru', 'Быстрее доставьте!!!', 3, 'c37c22345e53ce1c1a0cbb435a4fe761d1dbd4c15c795dc68c4ec174f1fa3ced'),
	(null, null, null, null, 'bist2wood@rambler.ru', null, 1, 'ffd93a5ddb3946d6af361d333a53e0c109df688da98a07d7765d81d4eeb16f33'),
	(null, null, null, null, null, null, null, '861653ae6d0609fe8008546a690430cb07ab3dd7e1b0f6b4bcf852375fa414fc'),
	(null, null, null, null, null, null, null, '1b3e3c016745d4fce631eaa0316123dae881a65a8ea860437039ad9a9041cd82'),
	(null, null, null, null, null, null, null, '3f8a1a559a879567b62112756a619a91b1b08bd1de558fb66550b70a6a23955d');

comment on table cart is 'Корзина покупателя';
comment on column cart.cart_id is 'Уникальный идентификатор корзины';
comment on column cart.first_name is 'Имя покупателя';
comment on column cart.last_name is 'Фамилия покупателя';
comment on column cart.address is 'Адрес доставки покупателя';
comment on column cart.phone is 'Контактный телефон покупателя';
comment on column cart.email is 'Емейл покупателя';
comment on column cart.comment is 'Дополнительны комментарий покупателя';
comment on column cart.delivery_type_id is 'Внешний ключ на идентификатор тип доставки';
comment on column cart.user_cookies_hash is 'Хэш куки пользователя';

--###########################################################################

create table product_to_cart (
	product_id bigint references product(product_id),
	cart_id bigint references cart(cart_id),
	quantity smallint check(quantity > 0) default 1,
	primary key (product_id, cart_id)
);

insert into product_to_cart (product_id, cart_id, quantity) values
	(14, 1, 1), -- Будильник Луч / Гордей
	(4, 2, 1), -- DOT / Часы Луч 78447326 / Анна
	(15, 2, 1), -- Ремень Луч 5552032 / Анна
	(4, 3, 1), -- КОЛЛЕКЦИЯ "AVIATOR" / Часы Луч 740280594 / Коля
	(6, 4, 2),
	(10, 4, 1),
	(1, 5, 1),
	(3, 6, 1),
	(4, 6, 1);

comment on table product_to_cart is 'Промежуточная таблица для связи товаров с корзиной';
comment on column product_to_cart.product_id is 'Внешний ключ на идентификатор товара';
comment on column product_to_cart.cart_id is 'Внешний ключ на идентификатор корзины';
comment on column product_to_cart.quantity is 'Количество заказываемых единиц товара';

--###########################################################################

create table md_order_status (
	order_status_id smallint generated always as identity primary key,
	order_status varchar(50) not null,
	status_description text
);

insert into md_order_status (order_status, status_description) values
	('awaiting_payment', 'Заказ оформлен, но платеж еще не поступил.'),
	('awaiting_shipment', ' Заказ был сформирован и упакован и ожидает получения от поставщика услуг доставки.'),
	('cancelled', 'Клиент отменил заказ.'),
	('сompleted', 'Заказ был забран и получение подтверждено клиентом.'),
	('pending', 'Клиент оформил заказ, заказ передан менеджеру на обработку.'),
	('shipped', 'Заказ был отправлен, но получение не подтверждено клиентом.');

comment on table md_order_status is 'Типы статусов оформленных заказов';
comment on column md_order_status.order_status_id is 'Уникальный идентификатор статуса заказа';
comment on column md_order_status.order_status is 'Наименование статуса заказа';
comment on column md_order_status.status_description is 'Описание статуса заказа';

--###########################################################################

create table "order" (
	cart_id bigint references cart(cart_id),
	created_at_dtm timestamp not null default current_timestamp,
	updated_at_dtm timestamp not null default current_timestamp,
	first_name varchar(50) not null check (length(first_name) >= 2),
	address varchar(300) not null check (length(address) >= 5),
	phone varchar(20) not null check (length(phone) >= 5),
	total_price numeric not null check (total_price > 0),
	order_status_id smallint references md_order_status(order_status_id) default 5,
	primary key (cart_id, updated_at_dtm)
);

insert into "order" (cart_id, created_at_dtm, updated_at_dtm, first_name, address, phone, total_price, order_status_id) values
	(1, '2025-04-10'::timestamp, '2025-04-10'::timestamp, 'Гордей', 'г. Волгоград, ул. Пинская, 65', '(8442)-30-12-83', 1690, 5),
	(2, '2025-04-12'::timestamp, '2025-04-12'::timestamp, 'Анна', 'Москва, ул. Воронцово Поле 12', '+7 (495) 917-90-41', 12490, 5),
	(3, '2025-04-15'::timestamp, '2025-04-15'::timestamp, 'Коля', 'Смоленск', '+74812245056', 9990, 5),
	(1, '2025-04-10'::timestamp, '2025-04-13'::timestamp, 'Гордей', 'г. Волгоград, ул. Пинская, 65', '(8442)-30-12-83', 1690, 1),
	(1, '2025-04-10'::timestamp, '2025-04-15'::timestamp, 'Гордей', 'г. Волгоград, ул. Пинская, 65', '(8442)-30-12-83', 1690, 2),
	(2, '2025-04-12'::timestamp, '2025-04-14'::timestamp, 'Анна', 'Москва, ул. Воронцово Поле 12', '+7 (495) 917-90-41', 12490, 1),
	(2, '2025-04-12'::timestamp, '2025-04-15'::timestamp, 'Анна', 'Москва, ул. Воронцово Поле 12', '+7 (495) 917-90-41', 12490, 2),
	(2, '2025-04-12'::timestamp, '2025-04-16'::timestamp, 'Анна', 'Москва, ул. Воронцово Поле 12', '+7 (495) 917-90-41', 12490, 6),
	(2, '2025-04-12'::timestamp, '2025-04-17'::timestamp, 'Анна', 'Москва, ул. Воронцово Поле 12', '+7 (495) 917-90-41', 12490, 4);

comment on table "order" is 'Таблица с заказами и статусом по заказам';
comment on column "order".cart_id is 'Внешний ключ на идентификатор корзины клиента';
comment on column "order".created_at_dtm is 'Дата создания заказа клиентом';
comment on column "order".updated_at_dtm is 'Дата изменения статуса по заказу клиента';
comment on column "order".first_name is 'Имя покупателя';
comment on column "order".address is 'Адрес доставки покупателя';
comment on column "order".phone is 'Контактный телефон покупателя';
comment on column "order".total_price is 'Общая сумма по заказу клиента';
comment on column "order".order_status_id is 'Внешний ключ на статус заказа клиента';

--###############################################################################################
	