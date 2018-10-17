From: joel@joelfernandes.org (Joel Fernandes)
Date: Wed, 17 Oct 2018 10:45:27 -0700
Subject: [PATCH v2 1/2] mm: Add an F_SEAL_FS_WRITE seal to memfd
In-Reply-To: <20181017120829.GA19731@infradead.org>
References: <20181009222042.9781-1-joel@joelfernandes.org>
 <20181017095155.GA354@infradead.org>
 <20181017103958.GB230639@joelaf.mtv.corp.google.com>
 <20181017120829.GA19731@infradead.org>
Message-ID: <20181017174527.GA107185@joelaf.mtv.corp.google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181017174527.9urZQHh7nt_7wVevSRwUUnJeTxwa7RTs2XrKlKq28JE@z>

On Wed, Oct 17, 2018@05:08:29AM -0700, Christoph Hellwig wrote:
> On Wed, Oct 17, 2018@03:39:58AM -0700, Joel Fernandes wrote:
> > > > This usecase cannot be implemented with the existing F_SEAL_WRITE seal.
> > > > To support the usecase, this patch adds a new F_SEAL_FS_WRITE seal which
> > > > prevents any future mmap and write syscalls from succeeding while
> > > > keeping the existing mmap active. The following program shows the seal
> > > > working in action:
> > > 
> > > Where does the FS come from?  I'd rather expect this to be implemented
> > > as a 'force' style flag that applies the seal even if the otherwise
> > > required precondition is not met.
> > 
> > The "FS" was meant to convey that the seal is preventing writes at the VFS
> > layer itself, for example vfs_write checks FMODE_WRITE and does not proceed,
> > it instead returns an error if the flag is not set. I could not find a better
> > name for it, I could call it F_SEAL_VFS_WRITE if you prefer?
> 
> I don't think there is anything VFS or FS about that - at best that
> is an implementation detail.
> 
> Either do something like the force flag I suggested in the last mail,
> or give it a name that matches the intention, e.g F_SEAL_FUTURE_WRITE.
> 

Ok, I agree. I like the name F_SEAL_FUTURE_WRITE you are proposing so I will
use that.

> > I could make it such that this seal would not be allowed unless F_SEAL_SHRINK
> > and F_SEAL_GROW are either previously set, or they are passed along with this
> > seal. Would that make more sense to you?
> 
> Yes.

Cool.

> > > >  static int memfd_add_seals(struct file *file, unsigned int seals)
> > > >  {
> > > > @@ -219,6 +220,9 @@ static int memfd_add_seals(struct file *file, unsigned int seals)
> > > >  		}
> > > >  	}
> > > >  
> > > > +	if ((seals & F_SEAL_FS_WRITE) && !(*file_seals & F_SEAL_FS_WRITE))
> > > > +		file->f_mode &= ~(FMODE_WRITE | FMODE_PWRITE);
> > > > +
> > > 
> > > This seems to lack any synchronization for f_mode.
> > 
> > The f_mode is set when the struct file is first created and then memfd sets
> > additional flags in memfd_create. Then later we are changing it here at the
> > time of setting the seal. I donot see any possiblity of a race since it is
> > impossible to set the seal before memfd_create returns. Could you provide
> > more details about what kind of synchronization is needed and what is the
> > race condition scenario you were thinking off?
> 
> Even if no one changes these specific flags we still need a lock due
> to rmw cycles on the field.  For example fadvise can set or clear
> FMODE_RANDOM.  It seems to use file->f_lock for synchronization.

Ok, I will acquire the f_lock before setting these, thanks for the
explanation. Will post updated patches today.

 - Joel
