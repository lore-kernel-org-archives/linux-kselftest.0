From: joel@joelfernandes.org (Joel Fernandes)
Date: Wed, 17 Oct 2018 03:39:58 -0700
Subject: [PATCH v2 1/2] mm: Add an F_SEAL_FS_WRITE seal to memfd
In-Reply-To: <20181017095155.GA354@infradead.org>
References: <20181009222042.9781-1-joel@joelfernandes.org>
 <20181017095155.GA354@infradead.org>
Message-ID: <20181017103958.GB230639@joelaf.mtv.corp.google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181017103958.PEuK5or8kByTGF9w9qEgBSP15c760dEW57LgL7Y7T0s@z>

On Wed, Oct 17, 2018@02:51:55AM -0700, Christoph Hellwig wrote:
> On Tue, Oct 09, 2018@03:20:41PM -0700, Joel Fernandes (Google) wrote:
> > One of the main usecases Android has is the ability to create a region
> > and mmap it as writeable, then drop its protection for "future" writes
> > while keeping the existing already mmap'ed writeable-region active.
> 
> s/drop/add/ ?
> 
> Otherwise this doesn't make much sense to me.

Sure, you are right that "add" is more appropriate. I'll change it to that.

> > This usecase cannot be implemented with the existing F_SEAL_WRITE seal.
> > To support the usecase, this patch adds a new F_SEAL_FS_WRITE seal which
> > prevents any future mmap and write syscalls from succeeding while
> > keeping the existing mmap active. The following program shows the seal
> > working in action:
> 
> Where does the FS come from?  I'd rather expect this to be implemented
> as a 'force' style flag that applies the seal even if the otherwise
> required precondition is not met.

The "FS" was meant to convey that the seal is preventing writes at the VFS
layer itself, for example vfs_write checks FMODE_WRITE and does not proceed,
it instead returns an error if the flag is not set. I could not find a better
name for it, I could call it F_SEAL_VFS_WRITE if you prefer?

> > Note: This seal will also prevent growing and shrinking of the memfd.
> > This is not something we do in Android so it does not affect us, however
> > I have mentioned this behavior of the seal in the manpage.
> 
> This seems odd, as that is otherwise split into the F_SEAL_SHRINK /
> F_SEAL_GROW flags.

I could make it such that this seal would not be allowed unless F_SEAL_SHRINK
and F_SEAL_GROW are either previously set, or they are passed along with this
seal. Would that make more sense to you?

> >  static int memfd_add_seals(struct file *file, unsigned int seals)
> >  {
> > @@ -219,6 +220,9 @@ static int memfd_add_seals(struct file *file, unsigned int seals)
> >  		}
> >  	}
> >  
> > +	if ((seals & F_SEAL_FS_WRITE) && !(*file_seals & F_SEAL_FS_WRITE))
> > +		file->f_mode &= ~(FMODE_WRITE | FMODE_PWRITE);
> > +
> 
> This seems to lack any synchronization for f_mode.

The f_mode is set when the struct file is first created and then memfd sets
additional flags in memfd_create. Then later we are changing it here at the
time of setting the seal. I donot see any possiblity of a race since it is
impossible to set the seal before memfd_create returns. Could you provide
more details about what kind of synchronization is needed and what is the
race condition scenario you were thinking off?

thanks for the review,

 - Joel
