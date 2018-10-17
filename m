From: hch at infradead.org (Christoph Hellwig)
Date: Wed, 17 Oct 2018 02:51:55 -0700
Subject: [PATCH v2 1/2] mm: Add an F_SEAL_FS_WRITE seal to memfd
In-Reply-To: <20181009222042.9781-1-joel@joelfernandes.org>
References: <20181009222042.9781-1-joel@joelfernandes.org>
Message-ID: <20181017095155.GA354@infradead.org>

On Tue, Oct 09, 2018 at 03:20:41PM -0700, Joel Fernandes (Google) wrote:
> One of the main usecases Android has is the ability to create a region
> and mmap it as writeable, then drop its protection for "future" writes
> while keeping the existing already mmap'ed writeable-region active.

s/drop/add/ ?

Otherwise this doesn't make much sense to me.

> This usecase cannot be implemented with the existing F_SEAL_WRITE seal.
> To support the usecase, this patch adds a new F_SEAL_FS_WRITE seal which
> prevents any future mmap and write syscalls from succeeding while
> keeping the existing mmap active. The following program shows the seal
> working in action:

Where does the FS come from?  I'd rather expect this to be implemented
as a 'force' style flag that applies the seal even if the otherwise
required precondition is not met.

> Note: This seal will also prevent growing and shrinking of the memfd.
> This is not something we do in Android so it does not affect us, however
> I have mentioned this behavior of the seal in the manpage.

This seems odd, as that is otherwise split into the F_SEAL_SHRINK /
F_SEAL_GROW flags.

>  static int memfd_add_seals(struct file *file, unsigned int seals)
>  {
> @@ -219,6 +220,9 @@ static int memfd_add_seals(struct file *file, unsigned int seals)
>  		}
>  	}
>  
> +	if ((seals & F_SEAL_FS_WRITE) && !(*file_seals & F_SEAL_FS_WRITE))
> +		file->f_mode &= ~(FMODE_WRITE | FMODE_PWRITE);
> +

This seems to lack any synchronization for f_mode.
