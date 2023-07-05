// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorPokemonDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$PokemonDatabaseBuilder databaseBuilder(String name) =>
      _$PokemonDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$PokemonDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$PokemonDatabaseBuilder(null);
}

class _$PokemonDatabaseBuilder {
  _$PokemonDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$PokemonDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$PokemonDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<PokemonDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$PokemonDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$PokemonDatabase extends PokemonDatabase {
  _$PokemonDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PokemonDao? _pokemonDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `FAVORITE_POKEMON` (`id` INTEGER NOT NULL, `abilities` TEXT NOT NULL, `baseExperience` INTEGER NOT NULL, `forms` TEXT NOT NULL, `gameIndices` TEXT NOT NULL, `height` INTEGER NOT NULL, `isDefault` INTEGER NOT NULL, `locationAreaEncounters` TEXT NOT NULL, `moves` TEXT NOT NULL, `name` TEXT NOT NULL, `order` INTEGER NOT NULL, `species` TEXT NOT NULL, `sprites` TEXT NOT NULL, `stats` TEXT NOT NULL, `types` TEXT NOT NULL, `weight` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PokemonDao get pokemonDao {
    return _pokemonDaoInstance ??= _$PokemonDao(database, changeListener);
  }
}

class _$PokemonDao extends PokemonDao {
  _$PokemonDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _pokemonInsertionAdapter = InsertionAdapter(
            database,
            'FAVORITE_POKEMON',
            (Pokemon item) => <String, Object?>{
                  'id': item.id,
                  'abilities': _abilityConverter.encode(item.abilities),
                  'baseExperience': item.baseExperience,
                  'forms': _propertyListConverter.encode(item.forms),
                  'gameIndices': _gameIndicesConverter.encode(item.gameIndices),
                  'height': item.height,
                  'isDefault': item.isDefault ? 1 : 0,
                  'locationAreaEncounters': item.locationAreaEncounters,
                  'moves': _movesConverter.encode(item.moves),
                  'name': item.name,
                  'order': item.order,
                  'species': _propertyConverter.encode(item.species),
                  'sprites': _spritesConverter.encode(item.sprites),
                  'stats': _statConverter.encode(item.stats),
                  'types': _typesConverter.encode(item.types),
                  'weight': item.weight
                }),
        _pokemonDeletionAdapter = DeletionAdapter(
            database,
            'FAVORITE_POKEMON',
            ['id'],
            (Pokemon item) => <String, Object?>{
                  'id': item.id,
                  'abilities': _abilityConverter.encode(item.abilities),
                  'baseExperience': item.baseExperience,
                  'forms': _propertyListConverter.encode(item.forms),
                  'gameIndices': _gameIndicesConverter.encode(item.gameIndices),
                  'height': item.height,
                  'isDefault': item.isDefault ? 1 : 0,
                  'locationAreaEncounters': item.locationAreaEncounters,
                  'moves': _movesConverter.encode(item.moves),
                  'name': item.name,
                  'order': item.order,
                  'species': _propertyConverter.encode(item.species),
                  'sprites': _spritesConverter.encode(item.sprites),
                  'stats': _statConverter.encode(item.stats),
                  'types': _typesConverter.encode(item.types),
                  'weight': item.weight
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Pokemon> _pokemonInsertionAdapter;

  final DeletionAdapter<Pokemon> _pokemonDeletionAdapter;

  @override
  Future<List<Pokemon>> getFavoritesPokemon() async {
    return _queryAdapter.queryList('SELECT * FROM FAVORITE_POKEMON',
        mapper: (Map<String, Object?> row) => Pokemon(
            id: row['id'] as int,
            abilities: _abilityConverter.decode(row['abilities'] as String),
            baseExperience: row['baseExperience'] as int,
            forms: _propertyListConverter.decode(row['forms'] as String),
            gameIndices:
                _gameIndicesConverter.decode(row['gameIndices'] as String),
            height: row['height'] as int,
            isDefault: (row['isDefault'] as int) != 0,
            locationAreaEncounters: row['locationAreaEncounters'] as String,
            moves: _movesConverter.decode(row['moves'] as String),
            name: row['name'] as String,
            order: row['order'] as int,
            species: _propertyConverter.decode(row['species'] as String),
            sprites: _spritesConverter.decode(row['sprites'] as String),
            stats: _statConverter.decode(row['stats'] as String),
            types: _typesConverter.decode(row['types'] as String),
            weight: row['weight'] as int));
  }

  @override
  Future<Pokemon?> existPokemon(int id) async {
    return _queryAdapter.query('SELECT * FROM FAVORITE_POKEMON WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Pokemon(
            id: row['id'] as int,
            abilities: _abilityConverter.decode(row['abilities'] as String),
            baseExperience: row['baseExperience'] as int,
            forms: _propertyListConverter.decode(row['forms'] as String),
            gameIndices:
                _gameIndicesConverter.decode(row['gameIndices'] as String),
            height: row['height'] as int,
            isDefault: (row['isDefault'] as int) != 0,
            locationAreaEncounters: row['locationAreaEncounters'] as String,
            moves: _movesConverter.decode(row['moves'] as String),
            name: row['name'] as String,
            order: row['order'] as int,
            species: _propertyConverter.decode(row['species'] as String),
            sprites: _spritesConverter.decode(row['sprites'] as String),
            stats: _statConverter.decode(row['stats'] as String),
            types: _typesConverter.decode(row['types'] as String),
            weight: row['weight'] as int),
        arguments: [id]);
  }

  @override
  Future<void> insertPokemon(Pokemon pokemon) async {
    await _pokemonInsertionAdapter.insert(pokemon, OnConflictStrategy.replace);
  }

  @override
  Future<void> deletePokemon(Pokemon pokemon) async {
    await _pokemonDeletionAdapter.delete(pokemon);
  }
}

// ignore_for_file: unused_element
final _abilityConverter = AbilityConverter();
final _gameIndicesConverter = GameIndicesConverter();
final _movesConverter = MovesConverter();
final _propertyConverter = PropertyConverter();
final _propertyListConverter = PropertyListConverter();
final _statConverter = StatConverter();
final _typesConverter = TypesConverter();
final _spritesConverter = SpritesConverter();
