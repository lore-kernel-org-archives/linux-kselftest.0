From: kraxel@redhat.com (Gerd Hoffmann)
Date: Tue, 11 Sep 2018 14:03:50 +0200
Subject: [PATCH v7] Add udmabuf misc device
In-Reply-To: <18750721.r4B5nx0M26@avalon>
References: <20180827093444.23623-1-kraxel@redhat.com>
 <21053714.0Xa7F2u2PE@avalon>
 <20180911065014.vo6qp6hkb7cjftdc@sirius.home.kraxel.org>
 <18750721.r4B5nx0M26@avalon>
Message-ID: <20180911120350.qtacdf2otwzuywv2@sirius.home.kraxel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180911120350.EsndqrxwHhWgY5rIzdnJnLfXX3zoQ9QqGar1yd8MNcU@z>

> > >> +	if (WARN_ON(vmf->pgoff >= ubuf->pagecount))
> > >> +		return VM_FAULT_SIGBUS;
> > > 
> > > Just curious, when do you expect this to happen ?
> > 
> > It should not.  If it actually happens it would be a bug somewhere,
> > thats why the WARN_ON.
> 
> But you seem to consider that this condition that should never happen still 
> has a high enough chance of happening that it's worth a WARN_ON(). I was 
> wondering why this one in particular, and not other conditions that also can't 
> happen and are not checked through the code. 

Added it while writing the code, to get any coding mistake I make
flagged right away instead of things exploding later on.

I can drop it.

> > >> +	ubuf = kzalloc(sizeof(struct udmabuf), GFP_KERNEL);
> > > 
> > > sizeof(*ubuf)
> > 
> > Why?  Should not make a difference ...
> 
> Because the day we replace
> 
> 	struct udmabuf *ubuf;
> 
> with
> 
> 	struct udmabuf_ext *ubuf;
> 
> and forget to change the next line, we'll introduce a bug. That's why 
> sizeof(variable) is preferred over sizeof(type). Another reason is that I can 
> easily see that
> 
> 	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
> 
> is correct, while using sizeof(type) requires me to go and look up the 
> declaration of the variable.

So it simplifies review, ok, will change it.

BTW: Maybe the kernel should pick up a neat trick from glib:

g_new0() is a macro which takes the type instead of the size as first
argument, and it casts the return value to that type.  So the compiler
will throw warnings in case of a mismatch.  That'll work better than
depending purely on the coder being careful and review catching the
remaining issues.

cheers,
  Gerd
