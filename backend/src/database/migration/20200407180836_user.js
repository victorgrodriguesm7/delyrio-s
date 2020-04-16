
exports.up = function(knex) {
    return knex.schema.createTable('user', function(table){
        table.string('uid').primary();
        table.string("name").notNullable();
        table.string('password').notNullable();
        table.string('phonenumber').unique();
        table.string('email');
        table.string('token').notNullable();
    });
};

exports.down = function(knex) {
    knex.schema.dropTable('user');
};
