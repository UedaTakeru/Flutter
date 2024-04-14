const { ApolloServer } = require("apollo-server");
const { readFileSync } = require("fs");
const { join } = require("path");
const { users } = require("./server/mock.js");

// スキーマの読み込み
const typeDefs = readFileSync(join(__dirname, "server/schema.graphql"), "utf8");

// リゾルバー
const resolvers = {
    Query: {
        users: (parent, args, context, info) => {
            const { published } = args;
            if (published) {
                return users.filter(user => user.posts.length > 0);
            } else {
                return users;
            }
        }
    }
};

// Apollo Serverの設定
const server = new ApolloServer({
    typeDefs,
    resolvers
});

// サーバーの起動
server.listen({ port: 4000 }).then(({ url }) => {
    console.log(`Server ready at ${url}`)
});
