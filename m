From: brendanhiggins@google.com (Brendan Higgins)
Date: Mon, 25 Mar 2019 15:18:12 -0700
Subject: [RFC v3 18/19] of: unittest: split out a couple of test cases
 from unittest
In-Reply-To: <767d14bf-3429-58b7-dcbf-c8ef86133265@gmail.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-19-brendanhiggins@google.com>
 <990bfc7d-dc5e-d8d3-c151-9b321ff2ac10@gmail.com>
 <CAFd5g45tOGgf_sKGYRC=fpnTBKGaG=8frbQdgZ3ZTkQFyTfP5A@mail.gmail.com>
 <88fe0546-7850-5bb4-9673-b1aef2dccb3e@gmail.com>
 <CAFd5g444f-FBq4x3U7BL-EY+bFxP0rsJhJ14=mjOi89PhMkURg@mail.gmail.com>
 <0e311e88-c4d4-e98d-1720-53a04bd526fc@gmail.com>
 <CAFd5g44NTZoSAJPMvXP2xvJgn7m5QoV-KJu2AMrr67+eL+CKrQ@mail.gmail.com>
 <d9f7e000-4cac-a35a-3ff9-60130e12ebea@gmail.com>
 <72cd1c5b-6f68-73ad-c8fd-f3a3268a0529@gmail.com>
 <CAFd5g46UU9wk+F6A5wnKYYtYKmmtv__SaY8eg6v-T9xUjsoxhA@mail.gmail.com>
 <bb5bcd3d-a09a-cfbe-c7fa-16e5eb75b0e4@gmail.com>
 <767d14bf-3429-58b7-dcbf-c8ef86133265@gmail.com>
Message-ID:
 <CAFd5g45yNw5VA5teZ0fBzqND47yfGZyFJiEfNqZfvNYJqiG78Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190325221812.WaxmQWVLjvkVzNE7Lyp-9jTnO3KwtmJrWKfgWyJUXwE@z>

On Thu, Mar 21, 2019@6:34 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 3/21/19 5:22 PM, Frank Rowand wrote:
> > On 2/27/19 7:52 PM, Brendan Higgins wrote:
>
> < snip >
>
> >> Now I know that, hermeticity especially, but other features as well
> >> (test suite summary, error on unused test case function, etc) are not
> >> actually in KUnit as it is under consideration here. Maybe it would be
> >> best to save these last two patches (18/19, and 19/19) until I have
> >> these other features checked in and reconsider them then?
> >
> > Thanks for leaving 18/19 and 19/19 off in v4.
>
> Oops, they got into v4 but as 16/17 and 17/17, I think.  But it sounds
> like you are planning to leave them out of v5.

Oh, I thought you meant v5 when you were thanking me. In any case, to
confirm, I will be leaving off 16/17, and 17/17 in the next version.
