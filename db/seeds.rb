
%w[ estagiario supervisor chefe ].each do |nome|
    Privilege.find_or_create_by!(action: nome)
end

%w[ gabriel joão ].each_with_index do |user, idx|
    next if User.find_by(nome: user)
    User.create(
        nome: user,
        email: "user#{idx}@email.com",
        password: "123456"
    )
end
