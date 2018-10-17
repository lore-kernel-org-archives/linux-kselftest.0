From: brendanhiggins at google.com (Brendan Higgins)
Date: Tue, 16 Oct 2018 17:03:01 -0700
Subject: [RFC v1 12/31] checkpatch: added support for struct MOCK(foo)
 syntax
In-Reply-To: <bad13afe8c71860a85f12130a57fe9a96f017cf3.camel@perches.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
 <20181016235120.138227-13-brendanhiggins@google.com>
 <bad13afe8c71860a85f12130a57fe9a96f017cf3.camel@perches.com>
Message-ID: <CAFd5g44VQqJVhUPQLHWzaXMbjJeGNs2nDZYTmzQ8OV7dyTXfVg@mail.gmail.com>

On Tue, Oct 16, 2018 at 4:59 PM Joe Perches <joe at perches.com> wrote:
>
> On Tue, 2018-10-16 at 16:51 -0700, Brendan Higgins wrote:
> > This adds struct MOCK(foo) as a NonptrType so that it is recognized
> > correctly in declarations.
>
> I think this commit message is lacking context.

Oh sorry, you are right. We added macros for generating mocks from
types, so we decided to name the generated mock types struct MOCK(foo)
(where the base type is struct foo); this commit makes checkpatch not
complain at this new syntax.
