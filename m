From: guro@fb.com (Roman Gushchin)
Date: Thu, 7 Jun 2018 13:52:27 +0100
Subject: [PATCH] kselftest/cgroup: fix a signedness bug
In-Reply-To: <20180607083001.m4z4wjev6j3sc423@kili.mountain>
References: <20180607083001.m4z4wjev6j3sc423@kili.mountain>
Message-ID: <20180607125224.GA4302@castle>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180607125227.St2nVTQMHPYVDP-a-mtf9QYKbeJd0wQjocHqtW1X1IA@z>

On Thu, Jun 07, 2018@11:30:02AM +0300, Dan Carpenter wrote:
> "len" needs to be signed for the error handling to work.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter at oracle.com>
> 
> diff --git a/tools/testing/selftests/cgroup/cgroup_util.c b/tools/testing/selftests/cgroup/cgroup_util.c
> index b69bdeb4b9fe..1e9e3c470561 100644
> --- a/tools/testing/selftests/cgroup/cgroup_util.c
> +++ b/tools/testing/selftests/cgroup/cgroup_util.c
> @@ -35,7 +35,7 @@ static ssize_t read_text(const char *path, char *buf, size_t max_len)
>  	return len;
>  }
>  
> -static ssize_t write_text(const char *path, char *buf, size_t len)
> +static ssize_t write_text(const char *path, char *buf, ssize_t len)
>  {
>  	int fd;
>  
> @@ -140,7 +140,7 @@ long cg_read_key_long(const char *cgroup, const char *control, const char *key)
>  int cg_write(const char *cgroup, const char *control, char *buf)
>  {
>  	char path[PATH_MAX];
> -	size_t len = strlen(buf);
> +	ssize_t len = strlen(buf);
>  
>  	snprintf(path, sizeof(path), "%s/%s", cgroup, control);
>  

Looks good to me!

Thanks!
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
