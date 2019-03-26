From: joel@joelfernandes.org (Joel Fernandes)
Date: Tue, 26 Mar 2019 19:48:55 -0400
Subject: [PATCH] rcutorture: Select from only online CPUs
In-Reply-To: <20190326204613.GS4102@linux.ibm.com>
References: <20190323034619.15792-1-joel@joelfernandes.org>
 <20190325150133.GA4102@linux.ibm.com>
 <CAEXW_YRDfOEr-hdbKGDC6amRaaqTCCBsowRhVwDqJd-1BoO17g@mail.gmail.com>
 <20190325164253.GE4102@linux.ibm.com>
 <CAEXW_YT8dS--pBrQoBO=G_d+4Ffi7o2++PQukh6dyNHqX-TLBg@mail.gmail.com>
 <20190326160140.GP4102@linux.ibm.com>
 <20190326183549.GA162738@google.com>
 <20190326184013.GA114492@google.com>
 <20190326204613.GS4102@linux.ibm.com>
Message-ID: <20190326234855.GA108868@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190326234855.uzN7S2Oht7dMh5H6VyCl1MCIP-0U3rjbjSg2OSgLoS8@z>

On Tue, Mar 26, 2019@01:46:13PM -0700, Paul E. McKenney wrote:
[snip]
> > Any way, I will just add back CPU0 forcefully to the cpus list in my testing,
> > without checking for the online file existence, and see what happens :-) If
> > there's no smoke, then I'll roll that into a patch and send it out.
> 
> Sounds good, especially if you include a few of the uniprocessor tests.  ;-)

Yes, I will do those as well. Thanks for the reminder :-). Let us wait on
merging until then, then. I will reply back here about the uni processor
testing tomorrow.

thanks,

 - Joel
