From: jarkko.sakkinen@linux.intel.com (Jarkko Sakkinen)
Date: Tue, 27 Nov 2018 15:13:48 -0800
Subject: [PATCH] selftests: add TPM 2.0 tests
In-Reply-To: <20181127225307.3wc3gd7zmfauie6i@gmail.com>
References: <20181127221059.25966-1-jarkko.sakkinen@linux.intel.com>
 <20181127224900.fpbqujcsqwgxpwyq@gmail.com>
 <20181127225307.3wc3gd7zmfauie6i@gmail.com>
Message-ID: <20181127231348.GB26051@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181127231348.0--shXBng_ZtAGimgLpuGOorVZzwg3PE4sthbC9ybHw@z>

On Tue, Nov 27, 2018@12:53:07PM -1000, Joey Pabalinas wrote:
> On Tue, Nov 27, 2018@12:49:00PM -1000, Joey Pabalinas wrote:
> > > +    def start_auth_session(self, session_type, name_alg = TPM2_ALG_SHA1):
> > > +        fmt = '>HII IIH16sHBHH'
> > > +        cmd = struct.pack(fmt,
> > > +                          TPM2_ST_NO_SESSIONS,
> > > +                          struct.calcsize(fmt),
> > > +                          TPM2_CC_START_AUTH_SESSION,
> > > +                          TPM2_RH_NULL,
> > > +                          TPM2_RH_NULL,
> > > +                          16,
> > > +                          '\0' * 16,
> > > +                          0,
> > > +                          session_type,
> > > +                          TPM2_ALG_NULL,
> > > +                          name_alg)
> > > +
> > > +        return struct.unpack('>I', self.send_cmd(cmd)[10:14])[0]
> > > +
> > > +    def __calc_pcr_digest(self, pcrs, bank_alg = TPM2_ALG_SHA1,
> > > +                          digest_alg = TPM2_ALG_SHA1):
> > > +        x = []
> > 
> > Is there a reason for using `'\0' * 16` there instead of just 0?
> 
> Nevermind, I keep forgetting that the * operator on strings performs
> repetition. I've been programming too much C lately, it seems.
> 
> Acked-By: Joey Pabalinas <joeypabalinas at gmail.com>

Thank you! Would be good to have these merged to the kernel tree so that
one can include both functionality and test case when needed to the
patch set.

/Jarkko
