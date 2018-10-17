From: Tim.Bird@sony.com (Tim.Bird@sony.com)
Date: Wed, 17 Oct 2018 17:52:08 +0000
Subject: [RFC v1 06/31] arch: um: enabled running kunit from User Mode
 Linux
In-Reply-To: <f0d64a0a-7914-f390-c0b5-dc7626b45476@ideasonboard.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
 <20181016235120.138227-7-brendanhiggins@google.com>
 <f0d64a0a-7914-f390-c0b5-dc7626b45476@ideasonboard.com>
Message-ID:
 <ECADFF3FD767C149AD96A924E7EA6EAF8052436B@USCULXMSG01.am.sony.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181017175208.HCq5XQavnFz8_XKIIjyko7_xpOISExFuirOxknRsqrM@z>



> -----Original Message-----
> From: Kieran Bingham 
> 
> Hi Brendan,
> 
> I very excitedly jumped on these patches to try them out, as this is
> essentially something I was trying to do a few weeks back.
> 
> On 17/10/18 00:50, Brendan Higgins wrote:
> > Makes minimum number of changes outside of the KUnit directories for
> > KUnit to build and run using UML.
> >
> > Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
> > ---
> >  Makefile             | 2 +-
> >  arch/um/Kconfig.rest | 3 +++
> 
> But this file isn't present on v4.19-rc8
> 
> It looks like the file is removed at f163977d21a2 ("um: cleanup Kconfig
> files")
> 
> What version have you currently based these patches on?
> Do you expect to keep a branch somewhere that's easy to pull in?
> 
> Please add me to the CC list as an interested party on later versions :-)
> 
> It might be of interest to the automated testing mailing list too ? (Tim?)

 I think this is interesting to groups doing automated testing of the kernel
(including myself) as another set of tests to run.  Right now I don't see it
as having any special attributes related to automation.  But I could be wrong.
 -- Tim
