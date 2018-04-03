From: ben.hutchings@codethink.co.uk (Ben Hutchings)
Date: Tue, 03 Apr 2018 21:10:30 +0100
Subject: [PATCH] test_firmware: fix setting old custom fw path back on
 exit, second try
In-Reply-To: <CAB=NE6VD7mqEE3TUpBdYm424dQPTD+np_KmT9R6JQEcBuTMkPA@mail.gmail.com>
References: <20180403194849.csgzr3jllt4f2qb7@xylophone.i.decadent.org.uk>
 <CAB=NE6VD7mqEE3TUpBdYm424dQPTD+np_KmT9R6JQEcBuTMkPA@mail.gmail.com>
Message-ID: <1522786230.2654.124.camel@codethink.co.uk>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180403201030.U18GumiLAdmPWXKmQcsoH5mHERs8UxTMiAr0gwfl0Ow@z>

On Tue, 2018-04-03@12:54 -0700, Luis R. Rodriguez wrote:
> On Tue, Apr 3, 2018 at 12:48 PM, Ben Hutchings
> > <ben.hutchings@codethink.co.uk> wrote:
> > Commit 65c79230576 tried to clear the custom firmware path on exit by
> > writing a single space to the firmware_class.path parameter.  This
> > doesn't work because nothing strips this space from the value stored
> > and fw_get_filesystem_firmware() only ignores zero-length paths.
> > 
> > Instead, write a null byte.
> > 
> > Fixes: 0a8adf58475 ("test: add firmware_class loader test")
> > Fixes: 65c79230576 ("test_firmware: fix setting old custom fw path back on exit")
> > Signed-off-by: Ben Hutchings <ben.hutchings at codethink.co.uk>
> 
> Thanks for the patch! Also can you re-send and address Greg and
> linux-kernel ? There's significant changes to the firmware API on its
> way to Linus to I think if we want to merge this it should go through
> Greg at this point as he also merged some new changes I made to these
> scripts.

OK.

> > ---
> >  tools/testing/selftests/firmware/fw_filesystem.sh | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/firmware/fw_filesystem.sh b/tools/testing/selftests/firmware/fw_filesystem.sh
> > index f9508e1a4058..6b63b6bf2661 100755
> > --- a/tools/testing/selftests/firmware/fw_filesystem.sh
> > +++ b/tools/testing/selftests/firmware/fw_filesystem.sh
> > @@ -46,9 +46,11 @@ test_finish()
> >                 echo "$OLD_TIMEOUT" >/sys/class/firmware/timeout
> >         fi
> >         if [ "$OLD_FWPATH" = "" ]; then
> > -               OLD_FWPATH=" "
> > +               # A zero-length write won't work; write a null byte
> > +               printf '\000' >/sys/module/firmware_class/parameters/path
> > +       else
> > +               echo -n "$OLD_FWPATH" >/sys/module/firmware_class/parameters/path
> 
> Odd I am pretty sure I tested this and it worked for me. Wonder what
> it could have been... What shell are you using? I used bash.

Seems to work the same way for me whether I use bash (interactive) or
dash (script interpreter, /bin/sh).  But there's no visual difference
between " \n" and "\n"; that's why I used od to show a hex dump in my
previous mail.

Ben.

>   Luis
> 
> >         fi
> > -       echo -n "$OLD_FWPATH" >/sys/module/firmware_class/parameters/path
> >         rm -f "$FW"
> >         rmdir "$FWPATH"
> >  }
> > --
> > 2.16.2
> > 
> 
> 
-- 
Ben Hutchings
Software Developer, Codethink Ltd.

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
