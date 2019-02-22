From: dave.hansen@intel.com (Dave Hansen)
Date: Fri, 22 Feb 2019 15:03:15 -0800
Subject: [PATCH v10 06/12] fs, arm64: untag user pointers in
 copy_mount_options
In-Reply-To: <a958e202cdbe6e1bac8a37b7f3d9881d1b22993d.1550839937.git.andreyknvl@google.com>
References: <cover.1550839937.git.andreyknvl@google.com>
 <a958e202cdbe6e1bac8a37b7f3d9881d1b22993d.1550839937.git.andreyknvl@google.com>
Message-ID: <a38275b0-f6cd-20e1-3c48-544846586a16@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190222230315.5t-3FnC88kVicKZiFPhhz2lC9onXIq37F6KXZthvxnY@z>

On 2/22/19 4:53 AM, Andrey Konovalov wrote:
> --- a/fs/namespace.c
> +++ b/fs/namespace.c
> @@ -2730,7 +2730,7 @@ void *copy_mount_options(const void __user * data)
>  	 * the remainder of the page.
>  	 */
>  	/* copy_from_user cannot cross TASK_SIZE ! */
> -	size = TASK_SIZE - (unsigned long)data;
> +	size = TASK_SIZE - (unsigned long)untagged_addr(data);
>  	if (size > PAGE_SIZE)
>  		size = PAGE_SIZE;

I would have thought that copy_from_user() *is* entirely capable of
detecting and returning an error in the case that its arguments cross
TASK_SIZE.  It will fail and return an error, but that's what it's
supposed to do.

I'd question why this code needs to be doing its own checking in the
first place.  Is there something subtle going on?
