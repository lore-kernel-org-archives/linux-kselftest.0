From: shuah@kernel.org (Shuah Khan)
Date: Thu, 6 Sep 2018 12:35:42 -0600
Subject: [PATCH v2] cgroup: kselftests: add test_core to .gitignore
In-Reply-To: <1536212843-3774-1-git-send-email-Lei.Yang@windriver.com>
References: <1536212843-3774-1-git-send-email-Lei.Yang@windriver.com>
Message-ID: <ae04ec24-5e2c-3f6d-42b3-453fcb508a01@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180906183542.Aqk-eXfqa1QpPlBL0TAhjfvxKB-Yl5Tb25BTIlX7o-U@z>

On 09/05/2018 11:47 PM, Lei Yang wrote:
> Update .gitignore file.
> 
> Signed-off-by: Lei Yang <Lei.Yang at windriver.com>
> ---
>  tools/testing/selftests/cgroup/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/cgroup/.gitignore b/tools/testing/selftests/cgroup/.gitignore
> index 95eb3a5..adacda5 100644
> --- a/tools/testing/selftests/cgroup/.gitignore
> +++ b/tools/testing/selftests/cgroup/.gitignore
> @@ -1 +1,2 @@
>  test_memcontrol
> +test_core
> 


Thanks. Applied to linux-kselftest next

-- Shuah
