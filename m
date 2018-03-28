From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Wed, 28 Mar 2018 13:21:12 +0900
Subject: [PATCH v6 05/21] tracing: probeevent: Cleanup print argument
 functions
In-Reply-To: <20180326132832.70e1797e@gandalf.local.home>
References: <152129024033.31874.15800253385376959274.stgit@devbox>
 <152129047203.31874.3188700720826213215.stgit@devbox>
 <20180323123647.4398ae48@gandalf.local.home>
 <20180326131733.ac156981d82c4a38dae307f4@kernel.org>
 <20180326132832.70e1797e@gandalf.local.home>
Message-ID: <20180328132112.c2d6662837e0e193796e83cd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180328042112.66JNRgbOvainIZ00ud9toFwhwr6vGRwFcYgJ2dMzZ4I@z>

On Mon, 26 Mar 2018 13:28:32 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Mon, 26 Mar 2018 13:17:33 +0900
> Masami Hiramatsu <mhiramat@kernel.org> wrote:
> 
> > > Masami Hiramatsu <mhiramat@kernel.org> wrote:
> > >   
> > > > Current print argument functions prints the argument
> > > > name too. It is not good for printing out multiple
> > > > values for one argument. This change it to just print
> > > > out the value.  
> > > 
> 
> 
> > 
> > Cleanup argument-printing functions to decouple it into name-printing and
> > value-printing, so that it can support more flexible argument expression,
> > like array type.
> 
> Ah, so this is a change to make it possible in the next patches to do
> something more? I'll update the change log to your above.

Yes, I'll update the patch description :)

Thanks!

> 
> That makes more sense. Thanks.
> 
> -- Steve
> 


-- 
Masami Hiramatsu <mhiramat at kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
