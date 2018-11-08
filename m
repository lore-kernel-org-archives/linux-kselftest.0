From: gorcunov@gmail.com (Cyrill Gorcunov)
Date: Thu, 8 Nov 2018 14:11:05 +0300
Subject: [PATCH] proc: fix proc-self-map-files selftest for arm
In-Reply-To: <CABdQkv_vWNbMgvR+1q9gNGHUjvvR5Pb3Z9t3YKhahp4h4P5isQ@mail.gmail.com>
References: <20181011184359.15627-1-rafael.tinoco@linaro.org>
 <20181011205601.GA32757@avx2> <20181011210256.GE2401@uranus.lan>
 <20181011213006.GA13485@avx2> <20181011220009.GF2401@uranus.lan>
 <52504bd5-b4ed-518b-f748-c634172c6c68@linaro.org>
 <20181015172140.GJ2401@uranus.lan>
 <CABdQkv_vWNbMgvR+1q9gNGHUjvvR5Pb3Z9t3YKhahp4h4P5isQ@mail.gmail.com>
Message-ID: <20181108111105.GC13195@uranus.lan>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181108111105.VwIn56RNq3Wl5Di26H397WYvrYT7HUCTBxyrY1ZxTI8@z>

On Thu, Nov 08, 2018@08:41:46AM -0200, Rafael David Tinoco wrote:
> >
> > As to me -- yes, I would move zero page testing to a separate memory testcase.
> > But since Alexey is the former author of the tests better wait for his opinion.
> 
> Alexey,
> 
> would you care if we turn those 2 tests into 1, taking care of the
> zero page testing elsewhere ? Would you mind if I send out a patch for
> that ?

Rafael, just make it so. While we preserve old functionality
I think it is fine.

	Cyrill
