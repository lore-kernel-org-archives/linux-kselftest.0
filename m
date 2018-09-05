From: lei.yang@windriver.com (lei yang)
Date: Wed, 5 Sep 2018 11:08:15 +0800
Subject: [PATCH] sysctl: kselftests: add test_core to .gitignore
In-Reply-To: <1536115175-10864-1-git-send-email-Lei.Yang@windriver.com>
References: <1536115175-10864-1-git-send-email-Lei.Yang@windriver.com>
Message-ID: <78c85cee-7af9-75fc-14c7-6565a7080008@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180905030815.H5HYgx6IKrNBSVuk9lYnbF0SJ4KVkyTSpOPOgUSVueA@z>

sorry, the title should be :"cgroup: kselftests: add test_core to 
.gitignore"

Lei



On 2018年09月05日 10:39, Lei Yang wrote:
> Update .gitignore files.
>
> Signed-off-by: Lei Yang <Lei.Yang at windriver.com>
> ---
>   tools/testing/selftests/cgroup/.gitignore | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/cgroup/.gitignore b/tools/testing/selftests/cgroup/.gitignore
> index 95eb3a5..adacda5 100644
> --- a/tools/testing/selftests/cgroup/.gitignore
> +++ b/tools/testing/selftests/cgroup/.gitignore
> @@ -1 +1,2 @@
>   test_memcontrol
> +test_core
