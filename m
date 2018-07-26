From: anders.roxell at linaro.org (Anders Roxell)
Date: Thu, 26 Jul 2018 09:07:52 +0200
Subject: [PATCH] selftests: cgroup: add gitignore file
In-Reply-To: <20180620225412.7894-1-anders.roxell@linaro.org>
References: <20180620225412.7894-1-anders.roxell@linaro.org>
Message-ID: <CADYN=9L9VutVezvXdXs_6htMvBJtdj2KxaGDc8XN7jV3hdAskg@mail.gmail.com>

On Thu, 21 Jun 2018 at 00:54, Anders Roxell <anders.roxell at linaro.org> wrote:
>
> Add the executable 'test_memcontrol' to a .gitignore file.
>
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> ---
>  tools/testing/selftests/cgroup/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 tools/testing/selftests/cgroup/.gitignore
>
> diff --git a/tools/testing/selftests/cgroup/.gitignore b/tools/testing/selftests/cgroup/.gitignore
> new file mode 100644
> index 000000000000..95eb3a53c381
> --- /dev/null
> +++ b/tools/testing/selftests/cgroup/.gitignore
> @@ -0,0 +1 @@
> +test_memcontrol
> --
> 2.17.1
>

Ping.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
