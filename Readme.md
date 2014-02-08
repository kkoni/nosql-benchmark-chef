# 環境設定の仕方(CentOS 6.4)

## 初期設定
### host名設定
```
> sudo hostname nosql-benchmark(n)
```

### hostsファイル編集
```
> sudo vi /etc/hosts
>   (IPアドレス) nosql-benchmark1
>   (IPアドレス) nosql-benchmark2
>   (IPアドレス) nosql-benchmark3
>   (IPアドレス) nosql-benchmark4
>   (IPアドレス) nosql-benchmark5
```

### 公開鍵作成・コピー
```
> ssh-keygen
> cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
> scp ~/.ssh/id_rsa.pub nosql-benchmark(n):~/.ssh/chef.pub
> ssh nosql-benchmark(n)
> cat ~/.ssh/chef.pub >> ~/.ssh/authorized_keys
```

### gitインストール
```
> wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
> sudo rpm -i rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
> sudo vi /etc/yum.repos.d/rpmforge.repo
    [rpmforge-extras]のenabledを1に変更
> sudo yum install git
```

### chefインストール
```
> curl -L https://www.opscode.com/chef/install.sh | sudo bash
> sudo /opt/chef/embedded/bin/gem install knife-solo --no-ri --no-rdoc
> sudo /opt/chef/embedded/bin/gem install berkshelf --no-ri --no-rdoc
```

### chef実行
```
> git clone https://github.com/eclipseline/nosql-benchmark-chef.git
> cd nosql-benchmark-chef
> /opt/chef/embedded/bin/berks --path=cookbooks
> knife solo prepare nosql-benchmark(n)
> knife solo cook nosql-benchmark(n)
```


## HBaseインストール

