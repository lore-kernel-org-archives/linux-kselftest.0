From: joel@joelfernandes.org (Joel Fernandes)
Date: Fri, 9 Nov 2018 00:49:28 -0800
Subject: [PATCH v3 resend 1/2] mm: Add an F_SEAL_FUTURE_WRITE seal to memfd
In-Reply-To: <20181108041537.39694-1-joel@joelfernandes.org>
References: <20181108041537.39694-1-joel@joelfernandes.org>
Message-ID: <20181109084928.GA37614@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181109084928.UzbXcrRb30MopGD2q4rw_ErQ-xRIlxhVzTzONp4j71c@z>

On Wed, Nov 07, 2018@08:15:36PM -0800, Joel Fernandes (Google) wrote:
> Android uses ashmem for sharing memory regions. We are looking forward
> to migrating all usecases of ashmem to memfd so that we can possibly
> remove the ashmem driver in the future from staging while also
> benefiting from using memfd and contributing to it. Note staging drivers
> are also not ABI and generally can be removed at anytime.
> 
> One of the main usecases Android has is the ability to create a region
> and mmap it as writeable, then add protection against making any
> "future" writes while keeping the existing already mmap'ed
> writeable-region active.  This allows us to implement a usecase where
> receivers of the shared memory buffer can get a read-only view, while
> the sender continues to write to the buffer.
> See CursorWindow documentation in Android for more details:
> https://developer.android.com/reference/android/database/CursorWindow
> 
> This usecase cannot be implemented with the existing F_SEAL_WRITE seal.
> To support the usecase, this patch adds a new F_SEAL_FUTURE_WRITE seal
> which prevents any future mmap and write syscalls from succeeding while
> keeping the existing mmap active. The following program shows the seal
> working in action:
> 
[...] 
> The output of running this program is as follows:
> ret=3
> map 0 passed
> write passed
> map 1 prot-write passed as expected
> future-write seal now active
> write failed as expected due to future-write seal
> map 2 prot-write failed as expected due to seal
> : Permission denied
> map 3 prot-read passed as expected
> 
> Cc: jreck at google.com
> Cc: john.stultz at linaro.org
> Cc: tkjos at google.com
> Cc: gregkh at linuxfoundation.org
> Cc: hch at infradead.org
> Reviewed-by: John Stultz <john.stultz at linaro.org>
> Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> ---
> v1->v2: No change, just added selftests to the series. manpages are
> ready and I'll submit them once the patches are accepted.
> 
> v2->v3: Updated commit message to have more support code (John Stultz)
>  	Renamed seal from F_SEAL_FS_WRITE to F_SEAL_FUTURE_WRITE
> 						(Christoph Hellwig)
> 	Allow for this seal only if grow/shrink seals are also
> 	either previous set, or are requested along with this seal.
> 						(Christoph Hellwig)
> 	Added locking to synchronize access to file->f_mode.
> 						(Christoph Hellwig)


Christoph, do the patches look Ok to you now? If so, then could you give an
Acked-by or Reviewed-by tag?

Thanks a lot,

 - Joel


>  include/uapi/linux/fcntl.h |  1 +
>  mm/memfd.c                 | 22 +++++++++++++++++++++-
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/fcntl.h b/include/uapi/linux/fcntl.h
> index 6448cdd9a350..a2f8658f1c55 100644
> --- a/include/uapi/linux/fcntl.h
> +++ b/include/uapi/linux/fcntl.h
> @@ -41,6 +41,7 @@
>  #define F_SEAL_SHRINK	0x0002	/* prevent file from shrinking */
>  #define F_SEAL_GROW	0x0004	/* prevent file from growing */
>  #define F_SEAL_WRITE	0x0008	/* prevent writes */
> +#define F_SEAL_FUTURE_WRITE	0x0010  /* prevent future writes while mapped */
>  /* (1U << 31) is reserved for signed error codes */
>  
>  /*
> diff --git a/mm/memfd.c b/mm/memfd.c
> index 2bb5e257080e..5ba9804e9515 100644
> --- a/mm/memfd.c
> +++ b/mm/memfd.c
> @@ -150,7 +150,8 @@ static unsigned int *memfd_file_seals_ptr(struct file *file)
>  #define F_ALL_SEALS (F_SEAL_SEAL | \
>  		     F_SEAL_SHRINK | \
>  		     F_SEAL_GROW | \
> -		     F_SEAL_WRITE)
> +		     F_SEAL_WRITE | \
> +		     F_SEAL_FUTURE_WRITE)
>  
>  static int memfd_add_seals(struct file *file, unsigned int seals)
>  {
> @@ -219,6 +220,25 @@ static int memfd_add_seals(struct file *file, unsigned int seals)
>  		}
>  	}
>  
> +	if ((seals & F_SEAL_FUTURE_WRITE) &&
> +	    !(*file_seals & F_SEAL_FUTURE_WRITE)) {
> +		/*
> +		 * The FUTURE_WRITE seal also prevents growing and shrinking
> +		 * so we need them to be already set, or requested now.
> +		 */
> +		int test_seals = (seals | *file_seals) &
> +				 (F_SEAL_GROW | F_SEAL_SHRINK);
> +
> +		if (test_seals != (F_SEAL_GROW | F_SEAL_SHRINK)) {
> +			error = -EINVAL;
> +			goto unlock;
> +		}
> +
> +		spin_lock(&file->f_lock);
> +		file->f_mode &= ~(FMODE_WRITE | FMODE_PWRITE);
> +		spin_unlock(&file->f_lock);
> +	}
> +
>  	*file_seals |= seals;
>  	error = 0;
>  
> -- 
> 2.19.1.930.g4563a0d9d0-goog
