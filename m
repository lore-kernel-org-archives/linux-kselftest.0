From: fklassen at appneta.com (Fred Klassen)
Date: Thu, 23 May 2019 19:10:05 -0700
Subject: [PATCH net 2/4] net/udpgso_bench_tx: options to exercise TX CMSG
In-Reply-To: <CAF=yD-JBf6k7VLa6FQowuD5xDFbq5cB4ScTi7kb1hieQFDKnbg@mail.gmail.com>
References: <20190523210651.80902-1-fklassen@appneta.com>
 <20190523210651.80902-3-fklassen@appneta.com>
 <CAF=yD-JBf6k7VLa6FQowuD5xDFbq5cB4ScTi7kb1hieQFDKnbg@mail.gmail.com>
Message-ID: <5061E2A7-EF7A-4C3C-9819-34AA8DE2CD0F@appneta.com>

> 
> To ensure that we do not regress, when adding options, please consider
> (just a general suggestion, not a strong request for this patch set)
> updating the kselftest to run a variant of the test with the new code
> coverage. In this case, make the code pass/fail instead of only user
> interpretable and add variants to udpgso.sh.

I had a look at how kselftest works, and I absolutely want to see this
work with these changes. I’ll investigate and implement in v2 patch.

I will most likely do a 5 second test. This seems to be sufficient to get
meaningful results

> can use more precise CMSG_SPACE based on worst case expectations, like
> in udp_sendmmsg
> 
>> +       char buf[1500];
> 
> no need for payload
> 
>> +static void flush_errqueue(int fd)
>> +{
>> +       if (cfg_poll) {
>> +               struct pollfd fds = { 0 };
>> +               int ret;
>> +
>> +               fds.fd = fd;
>> +               fds.events = POLLERR;
> 
> no need to pass POLLERR, it is always returned in revents.
