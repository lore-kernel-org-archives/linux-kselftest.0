From: dsahern at gmail.com (David Ahern)
Date: Wed, 17 Jan 2018 12:48:54 -0800
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 02/12] selftests:
 forwarding: Add a test for FDB learning
In-Reply-To: <20180115191853.26129-3-idosch@mellanox.com>
References: <20180115191853.26129-1-idosch@mellanox.com>
 <20180115191853.26129-3-idosch@mellanox.com>
Message-ID: <33d3f4a4-8b92-60da-3e1f-327effb7eda0@gmail.com>

On 1/15/18 11:18 AM, Ido Schimmel wrote:
> diff --git a/tools/testing/selftests/forwarding/lib.sh b/tools/testing/selftests/forwarding/lib.sh
> index bb423371f4de..264bf0af4c4d 100644
> --- a/tools/testing/selftests/forwarding/lib.sh
> +++ b/tools/testing/selftests/forwarding/lib.sh
> @@ -22,6 +22,11 @@ if [[ ! -x "$(command -v jq)" ]]; then
>  	exit 0
>  fi
>  
> +if [[ ! -x "$(command -v mausezahn)" ]]; then
> +	echo "SKIP: mausezahn not installed"
> +	exit 0
> +fi
> +

The checks are good, but hitting a collision with this one:
$   ./router.sh
SKIP: mausezahn not installed

For debian, it is mz not mausezahn.

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
