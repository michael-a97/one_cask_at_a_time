import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:one_cask_at_a_time/core/core.dart';
import 'package:one_cask_at_a_time/features/features.dart';

void main() {
  group('$ProductsCubit', () {
    late ProductRepository productRepository;
    late ProductsCubit productsCubit;

    setUp(() {
      productRepository = MockProductRepository();
      productsCubit = ProductsCubit(productRepository);
    });

    group('load', () {
      blocTest<ProductsCubit, ProductsState>(
        'should emit [ProductsLoading, ProductsLoaded] states when '
        'successful',
        setUp: () {
          when(
            () => productRepository.find(),
          ).thenAnswer((_) async => right(_products));
        },
        build: () => productsCubit,
        act: (cubit) => cubit.load(),
        expect: () => const [ProductsLoading(), ProductsLoaded(_products)],
      );

      blocTest(
        'should emit [ProductsLoading, ProductsFailure] states when '
        'unsuccessful',
        setUp: () {
          when(() => productRepository.find()).thenAnswer(
            (_) async => left(ProductLoadingFailureType.networkError),
          );
        },
        build: () => productsCubit,
        act: (cubit) => cubit.load(),
        expect: () => const [
          ProductsLoading(),
          ProductsFailure(ProductLoadingFailureType.networkError),
        ],
      );
    });
  });
}

class MockProductRepository extends Mock implements ProductRepository {}

const _products = [
  Product(
    id: 1,
    name: 'Talisker',
    age: 18,
    year: 2025 - 18,
    caskNumber: '#2504',
    distillery: 'Talisker Distillery',
    region: 'Isle of Skye',
    country: 'Scotland',
    type: 'Single Malt Scotch Whisky',
    ageStatement: '18 Years Old',
    filled: '2020-01-01',
    bottled: '2020-01-01',
    abv: '45.8%',
    size: '700ml',
    finish: 'Rich and smoky with a hint of sea salt',
  ),
  Product(
    id: 2,
    name: 'Springbank',
    age: 15,
    year: 2025 - 15,

    caskNumber: '#1234',
    distillery: 'Springbank Distillery',
    region: 'Campbeltown',
    country: 'Scotland',
    type: 'Single Malt Scotch Whisky',
    ageStatement: '15 Years Old',
    filled: '2019-05-01',
    bottled: '2019-05-01',
    abv: '46%',
    size: '700ml',
    finish: 'Complex with notes of fruit and spice',
  ),
  Product(
    id: 3,
    name: 'Glenfiddich',
    age: 12,
    year: 2025 - 12,

    caskNumber: '#5678',
    distillery: 'Glenfiddich Distillery',
    region: 'Speyside',
    country: 'Scotland',
    type: 'Single Malt Scotch Whisky',
    ageStatement: '12 Years Old',
    filled: '2021-03-01',
    bottled: '2021-03-01',
    abv: '40%',
    size: '700ml',
    finish: 'Smooth and fruity with a hint of oak',
  ),
  Product(
    id: 4,
    name: 'Lagavulin',
    age: 16,
    year: 2025 - 16,

    caskNumber: '#7890',
    distillery: 'Lagavulin Distillery',
    region: 'Islay',
    country: 'Scotland',
    type: 'Single Malt Scotch Whisky',
    ageStatement: '16 Years Old',
    filled: '2018-07-01',
    bottled: '2018-07-01',
    abv: '43%',
    size: '700ml',
    finish: 'Peaty and smoky with a long finish',
  ),
  Product(
    id: 5,
    name: 'Macallan',
    age: 21,
    year: 2025 - 21,

    caskNumber: '#3456',
    distillery: 'Macallan Distillery',
    region: 'Speyside',
    country: 'Scotland',
    type: 'Single Malt Scotch Whisky',
    ageStatement: '21 Years Old',
    filled: '2017-09-01',
    bottled: '2017-09-01',
    abv: '43%',
    size: '700ml',
    finish: 'Rich and complex with notes of dried fruit and spice',
  ),
  Product(
    id: 6,
    name: 'Highland Park',
    age: 18,
    year: 2025 - 18,

    caskNumber: '#2345',
    distillery: 'Highland Park Distillery',
    region: 'Orkney',
    country: 'Scotland',
    type: 'Single Malt Scotch Whisky',
    ageStatement: '18 Years Old',
    filled: '2020-11-01',
    bottled: '2020-11-01',
    abv: '43%',
    size: '700ml',
    finish: 'Balanced with a hint of heather and smoke',
  ),
];
