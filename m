From: viro at zeniv.linux.org.uk (Al Viro)
Date: Tue, 21 May 2019 20:20:09 +0100
Subject: [PATCH 1/2] open: add close_range()
In-Reply-To: <28114.1558456227@warthog.procyon.org.uk>
References: <20190521150006.GJ17978@ZenIV.linux.org.uk>
 <20190521113448.20654-1-christian@brauner.io>
 <28114.1558456227@warthog.procyon.org.uk>
Message-ID: <20190521192009.GK17978@ZenIV.linux.org.uk>

On Tue, May 21, 2019 at 05:30:27PM +0100, David Howells wrote:

> If we can live with close_from(int first) rather than close_range(), then this
> can perhaps be done a lot more efficiently by:
> 
> 	new = alloc_fdtable(first);
> 	spin_lock(&files->file_lock);
> 	old = files_fdtable(files);
> 	copy_fds(new, old, 0, first - 1);
> 	rcu_assign_pointer(files->fdt, new);
> 	spin_unlock(&files->file_lock);
> 	clear_fds(old, 0, first - 1);
> 	close_fdt_from(old, first);
> 	kfree_rcu(old);

I really hate to think how that would interact with POSIX locks...
