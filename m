Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.42.203.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09428396B8C;
	Fri, 17 Jul 2026 07:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.42.203.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784272886; cv=none; b=LehtE0tbIct2ln2T42WN6FVOC2zopgnxuMO7+r4HeXZ4HYhcHuX8ykJO2qejJ08unhC7pIpq04Hr/HJWX9ZTd6AxJd+DMWP0/m9hPKKrMxeed4bM3nbvsXk/91wOll5AqReL7zXX84cEsCSXiTZWOyhy534/jQTQ//Rtm8lIz4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784272886; c=relaxed/simple;
	bh=OcwE+olHpjuaYEfbwu7JL1ZU+cKDD7oxjuvgEGzcTKw=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=nC2OPOKrgqaweVHjsRES0k7cFWvFa5pT4I0G8m06VKpZZGkagaxDtIMgZFlfvPZLrfQy3v0FkUQbiv/DRX8CM2eFCitZ/d02qgbKISJgDI4gEgKZWhsTgPApB9v2cr66V/rlgd6WhVtfDwI1B2HllpxNCfQF9+WOTT3qbWYdppk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=iUSt/YOo; arc=none smtp.client-ip=52.42.203.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="iUSt/YOo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1784272881; x=1815808881;
  h=mime-version:content-transfer-encoding:subject:from:to:
   cc:in-reply-to:references:date:message-id;
  bh=aAGJV95goVM0KJwiV7tyq6t45oLxWYSdWPqLSwSGpJo=;
  b=iUSt/YOoHJjYbnaQMcxObG7jYxhIEM6gmKrdfiZrHQ7mC1By5q+3ix1f
   AtndPxc673aojyM4NGDsu7APeSZES+5KekGOPQrIK/79bqKeLt4qCM5ak
   xvosCCyohR0BgiCxbAE4B8nd5YksunkTmrl5V+8yDMsmdf6kI09kaRXOV
   vbJ+GaKs1a2pad4G37arPUUXp1YaFMf7UP0sSAQFFkATSeW8BnUL354AJ
   fosYo6TRktTo8oUs02O9hxEwGYYjNYcWWA18/1SuCasyvofNsmgJUL2X6
   9B6RZBqohWr//ixUR5cwLGdVGZICw9oLMYwYZcVVsBeUlxI+wRSACAef8
   A==;
X-CSE-ConnectionGUID: 0LY0RsIZRjWI9qoUzE164Q==
X-CSE-MsgGUID: /kSTovxzT0u902tZue2SYg==
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="23863091"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 07:21:05 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:2487]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.177:2525] with esmtp (Farcaster)
 id ecea8e3f-91da-4d7f-9695-2d520211b337; Fri, 17 Jul 2026 07:21:05 +0000 (UTC)
X-Farcaster-Flow-ID: ecea8e3f-91da-4d7f-9695-2d520211b337
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Fri, 17 Jul 2026 07:21:05 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Fri, 17 Jul 2026 07:20:59 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 net-next 3/7] selftests/ptp: Add testptp support for
 attributes ioctls
From: Arthur Kiyanovski <akiyano@amazon.com>
To: saeed bishara <saeed.bishara.os@gmail.com>
CC: Arthur Kiyanovski <akiyano@amazon.com>, David Miller
	<davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	<netdev@vger.kernel.org>, Richard Cochran <richardcochran@gmail.com>, "Eric
 Dumazet" <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "David
 Woodhouse" <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	Miroslav Lichvar <mlichvar@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Wen Gu <guwen@linux.alibaba.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	David Woodhouse <dwmw@amazon.com>, Yonatan Sarna <ysarna@amazon.com>, "Zorik
 Machulsky" <zorik@amazon.com>, Alexander Matushevsky <matua@amazon.com>,
	"Saeed Bshara" <saeedb@amazon.com>, Matt Wilson <msw@amazon.com>, Anthony
 Liguori <aliguori@amazon.com>, Nafea Bshara <nafea@amazon.com>, Evgeny
 Schmeilin <evgenys@amazon.com>, Netanel Belgazal <netanel@amazon.com>, Ali
 Saidi <alisaidi@amazon.com>, Benjamin Herrenschmidt <benh@amazon.com>, Noam
 Dagan <ndagan@amazon.com>, David Arinzon <darinzon@amazon.com>, Evgeny
 Ostrovsky <evostrov@amazon.com>, Ofir Tabachnik <ofirt@amazon.com>, Amit
 Bernstein <amitbern@amazon.com>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <shuah@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Simon Horman
	<horms@kernel.org>, <vadim.fedorenko@linux.dev>
In-Reply-To: <CAHfVqdWDaLEKYMw-ZfkYvKLoSJ-_HOm3X9hUUhEf7ReBbOi__w@mail.gmail.com>
References: <20260714020340.25014-1-akiyano@amazon.com>
 <20260714020340.25014-4-akiyano@amazon.com>
 <CAHfVqdWDaLEKYMw-ZfkYvKLoSJ-_HOm3X9hUUhEf7ReBbOi__w@mail.gmail.com>
Date: Fri, 17 Jul 2026 07:20:53 +0000
Message-ID: <178427285301.16508.9929147333505968694.b4-reply@b4>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: EX19D036UWC002.ant.amazon.com (10.13.139.242) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On 2026-07-16 16:00:49+03:00, saeed bishara wrote:
> >                 " -t val     shift the ptp clock time by 'val' seconds\n"
> >                 " -T val     set the ptp clock time to 'val' seconds\n"
> >                 " -x val     get an extended ptp clock time with the desired number of samples (up to %d)\n"
> > +               " -a val     get extended timestamps with attributes (error_bound,\n"
> 
> timestamps -> ptp clock to be consistent
> also, have you considered making the "-a" additional flag to -x and -A
> instead of an exclusive option?
> 
> > +               printf("sample #%2d: unknown clock %d %s: %lld.%09u\n",
> > +                      sample_num, clockid, when, sec, nsec);
> 
> In the case of an unknown clock, will the additional parameters
> (when/sec/..) be useful?
> 
> >                 break;
> >         }
> >  }
> > @@ -188,6 +193,7 @@ int main(int argc, char *argv[])
> >         struct ptp_sys_offset *sysoff;
> >         struct ptp_sys_offset_extended *soe;
> >         struct ptp_sys_offset_precise *xts;
> > +       struct ptp_sys_offset_attrs *attrs_data;
> >
> >         char *progname;
> >         unsigned int i;
> > @@ -208,7 +214,9 @@ int main(int argc, char *argv[])
> >         int list_pins = 0;
> >         int pct_offset = 0;
> >         int getextended = 0;
> > +       int getextendedattrs = 0;
> >         int getcross = 0;
> > +       int getcrossattrs = 0;
> >         int n_samples = 0;
> >         int pin_index = -1, pin_func;
> >         int pps = -1;
> > @@ -226,7 +234,8 @@ int main(int argc, char *argv[])
> >
> >         progname = strrchr(argv[0], '/');
> >         progname = progname ? 1+progname : argv[0];
> > -       while (EOF != (c = getopt(argc, argv, "cd:e:E:f:F:ghH:i:k:lL:n:o:p:P:rsSt:T:w:x:Xy:z"))) {
> > +       while (EOF != (c = getopt(argc, argv,
> > +                                 "a:Acd:e:E:f:F:ghH:i:k:lL:n:o:p:P:rsSt:T:w:x:Xy:z"))) {
> >                 switch (c) {
> >                 case 'c':
> >                         capabilities = 1;
> > @@ -311,9 +320,22 @@ int main(int argc, char *argv[])
> >                                 return -1;
> >                         }
> >                         break;
> > +               case 'a':
> > +                       getextendedattrs = atoi(optarg);
> > +                       if (getextendedattrs < 1 ||
> > +                           getextendedattrs > PTP_MAX_SAMPLES) {
> > +                               fprintf(stderr,
> > +                                       "number of extended attrs timestamp samples must be between 1 and %d; was asked for %d\n",
> > +                                       PTP_MAX_SAMPLES, getextendedattrs);
> > +                               return -1;
> > +                       }
> > +                       break;
> >                 case 'X':
> >                         getcross = 1;
> >                         break;
> > +               case 'A':
> > +                       getcrossattrs = 1;
> > +                       break;
> >                 case 'y':
> >                         if (!strcasecmp(optarg, "realtime"))
> >                                 ext_clockid = CLOCK_REALTIME;
> > @@ -367,6 +389,8 @@ int main(int argc, char *argv[])
> >                                "  %d programmable pins\n"
> >                                "  %d cross timestamping\n"
> >                                "  %d adjust_phase\n"
> > +                              "  %d extended_attrs\n"
> > +                              "  %d precise_attrs\n"
> >                                "  %d maximum phase adjustment (ns)\n",
> >                                caps.max_adj,
> >                                caps.n_alarm,
> > @@ -376,6 +400,8 @@ int main(int argc, char *argv[])
> >                                caps.n_pins,
> >                                caps.cross_timestamping,
> >                                caps.adjust_phase,
> > +                              caps.extended_attrs,
> > +                              caps.precise_attrs,
> >                                caps.max_phase_adj);
> >                 }
> >         }
> > @@ -648,6 +674,49 @@ int main(int argc, char *argv[])
> >                 free(soe);
> >         }
> >
> > +       if (getextendedattrs) {
> > +               attrs_data = calloc(1, sizeof(*attrs_data) +
> > +                                   getextendedattrs * sizeof(struct ptp_timestamp));
> > +               if (!attrs_data) {
> > +                       perror("calloc");
> > +                       return -1;
> > +               }
> > +
> > +               attrs_data->request.num_samples = getextendedattrs;
> > +               attrs_data->request.clock_id = ext_clockid;
> > +
> > +               if (ioctl(fd, PTP_SYS_OFFSET_EXTENDED_ATTRS, attrs_data)) {
> > +                       perror("PTP_SYS_OFFSET_EXTENDED_ATTRS");
> > +               } else {
> > +                       printf("extended attrs timestamp request returned %d samples\n",
> > +                              getextendedattrs);
> > +
> > +                       for (i = 0; i < getextendedattrs; i++) {
> > +                               struct ptp_timestamp *ts = &attrs_data->timestamps[i];
> > +
> > +                               printf("  sample #%u:\n", i);
> > +                               printf("    sys before: %lld ns\n",
> > +                                      (long long)ts->pre_systime.sys_time);
> > +                               printf("    phc time:   %lld.%09u\n",
> > +                                      ts->devtime.device_time.sec,
> > +                                      ts->devtime.device_time.nsec);
> > +                               if (ts->devtime.attrs.valid & PTP_ATTRS_VALID_ERROR_BOUND)
> > +                                       printf("    error_bound: %u ns\n",
> > +                                              ts->devtime.attrs.error_bound);
> 
> in case device doesn't report error bound, I think it's better to
> print explicit message

All addressed in v5: -a is now a modifier on -x/-X (dropped -A, use
-X -a) as you suggested; usage text updated; the unknown-clock line is
trimmed to just the clock id; and attributes the device doesn't report
now print "not reported".

