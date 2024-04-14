const users = [
    {
        id: 1,
        name: "John Doe",
        email: "john@example.com",
        profile: {
            id: 1,
            bio: "Lorem ipsum dolor sit amet.",
            userId: 1
        },
        posts: [
            {
                id: 1,
                title: "First Post",
                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                published: true,
                authorId: 1
            }
        ]
    },
    {
        id: 2,
        name: "Jane Smith",
        email: "jane@example.com",
        profile: {
            id: 2,
            bio: "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            userId: 2
        },
        posts: []
    }
];

module.exports = { users };
