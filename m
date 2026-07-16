Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B261420893
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784206866; cv=pass; b=G2xKu0wkWk5gb85nRU/4OifDDl9oZIdr//KDeWvi0gNbry0JDw8PtcwFqOn/u9i/4qLL0ppYN/my8JDKi25LPPwOpkngH48adohpGz7KVG5UQOk43eX32iBKZX6pVXF/89950WqTD4rzuHGmQO5tgjLc+68hE0QYBd2BuD+zoMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784206866; c=relaxed/simple;
	bh=VKUo370fMISPlFqMzsuyMVMvgTexx95wIxlxD2hspW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MSXkJw10zu1Ipa7sEk5FBZRoMDCW27hYSpIPTErbw3lxrWYwd7Sn3ZbUjkb8I9FkHPTiH1VdE6HCBKXTsq50LUyblK70b3eE28xCVKoPwr2n36at64Ymjg0JLTeik+wl9NLNV7fg345tx+f888UTbq18PjNxbTUalhlDivGKm+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqMddGu/; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqMddGu/"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69c5eb6dfd3so8988652a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 06:01:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784206861; cv=none;
        d=google.com; s=arc-20260327;
        b=GjjvwOrZG25OXiHD+Cbtc6RoQjqcpIB8Q8dx+3jIgI9WsYZso8hPiwm0BRKpllEMzT
         GWxr7r9abYGIuXt8oncU9d3IgchgA4HVAprEXXZyj5APfwnzvsbc++A0atuh2KbY5+Br
         yVU5QiY0ELiSfCo8TsneufciBS248eKltzKDcbS8LpjuaMcP5/mNERg8dtaPz4IbHF9W
         9jKJGhXbsXA6v1ptplXwWIM723fNwb/lbzLsa0F7fCJWv93VBvj3dg7+1wT7PQnghulD
         ceZdcvvPH1mb+7Yo7ipi1a7icItRlLdDksNnvImqvDUmNvogrDvVxoNU9R+cR6zD2Da5
         QoQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zXERITO2eXf24evX2s/DpViJVD6miQTBJvHhyq+Sh2Q=;
        fh=ZWXMibTH6nN4NzBklE7z8Dtkk9zrZaU/KUY+Qwt04io=;
        b=fcElF4zUl2Sz2MViH0rmy8hcuFEm/SAJT9nnt7GtChGy12da3sMwCrZNRCTIMP95e1
         TFnbvll+38oTLTKwRQnSTOVhjaGCG5TpbwTCYKPQhslnDMXrnVGQxUhQjgdERJMFCbp8
         O9uCyN6wOJSrTXE/6dNyAfudLgo/B4Tfss5BO/yTP0aMSc5D2P3R+WiClNXh5MYWSsEc
         TuQELpZ5HAyWsAwOk3QdCRZHWzQXYZxOtZUosgSztgN3B2fU0/CFlmz4AqRGXNP+ZH21
         ygJ6dt9zsEhaUftxgdKyqRwgkcsTowprgFpKk2a/cIWycY9l+xw5HTdeCgHA19y2e+Mn
         fTYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784206861; x=1784811661; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zXERITO2eXf24evX2s/DpViJVD6miQTBJvHhyq+Sh2Q=;
        b=dqMddGu/wql9KvR/BK1o0dtNhHc90x5+vrsOlUfyz4XCywQVgCKZ19JX70Nnpk9uWN
         cYP+H9M7nDGhdfHCsdUNpiGp3793KBrlHFjofzta7dvJsE8duItRsa7SPgxH6CjyvxDM
         zUdpckDGagmB9DSBJOHjPsOCyW3QNTM69PFyt42FN86COGpcS38GCZVtMN2LqzccYHUy
         BD7GZ43kk7ZjjyErvglj/46oQzhwxJifkOyoOCPsnTYOh7dO9muSZ6PLmSNBJTIX4x/s
         5L7MBHpssn5ahiD8sTBj3O3WzSMJU4sfxJdHsHkAz/wdxZZWlNVN3buVePIdhj2C1TzR
         B+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784206861; x=1784811661;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zXERITO2eXf24evX2s/DpViJVD6miQTBJvHhyq+Sh2Q=;
        b=UqL+/1hOlQNj7v4hpN6wn6joPDvAryB050RyHh/meq3DAn3z0c+/CNmSvsA1rMGagg
         AT60q+R6W827CjQh6ag/51C6if6uwnsQ0Ciindtl6C/DN5tJPqHmCjmp9bhJf2NpM6OG
         lYN5XNPZPhE9GLffhD9Au22B3uAw/aqTeXOgqNBUlCzmwqxYWr7T0dTYTYpAHuBI3jbh
         QSg9RmMkQIHGG46OTV1jq8TOXDwLe0mabgpO1Pu62qRbAhUAsQ80JeL6U4REMVCmiKnG
         cAzAhDXJOm5Lu6/ABZSxxBYJfQkEA+ufuCkUqGzj3tr+iAG/htggCk+t216Hb9qO0JLQ
         /Vuw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8vETJ/KZ9T8KcEqV00L6enXRFP2xBHqsr1WbskFyaXPvqD7Wi8WoI8B83CK34o3l0/P7TNa8Nx7SW67vXYyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrT7P+utQdSV4rN60yNg95SYiyHfk4Nyh9sblht18upIiJ4wje
	3244yA40K82J4OEDlpvcVgCpgxL/P+TAh5K50+uKNyh+0Kg7l/ZBPPjlZC/5RrJ2xYLVMJ3J+HJ
	HHWuvp8FwWi46Lc1PuP9oYjSnKbdory4=
X-Gm-Gg: AfdE7clGgEspi9jgPTr6fScp/D8csRxXOCT3RyqE8V009dhv78h2jdp0880RgmXiNEP
	DGyuMry6kWeEniqSymwgpPYhf7TMvnh0otIX7aECQ4TIVUAU6dwPcGv8KzwReLygBZAiRjFAfsF
	t/ez4Hw6wucs5xKZQrR8XVppeYMIwXKr2ULsMbrmiKk1fVgFlzSEyh8GXwtLfmu/9pjcKDnsqjr
	z1WT7m0SVL4Cp+VysmGHW43KFI1xHV07a5KUYfOxJLjt/DqwFE5YQA8n9rzJJHOhb6ShBErZw1y
	tn/R6NCAsHwmY0bVW5rkU9ot6a7MoIY=
X-Received: by 2002:a05:6402:5193:b0:698:3469:faa3 with SMTP id
 4fb4d7f45d1cf-69cd6c711c8mr5713796a12.10.1784206860545; Thu, 16 Jul 2026
 06:01:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714020340.25014-1-akiyano@amazon.com> <20260714020340.25014-4-akiyano@amazon.com>
In-Reply-To: <20260714020340.25014-4-akiyano@amazon.com>
From: saeed bishara <saeed.bishara.os@gmail.com>
Date: Thu, 16 Jul 2026 16:00:49 +0300
X-Gm-Features: AUfX_myAoOWH5t5VUI4MOkcCF7lHw7hjBIHVeiT5yTh7jkx8162zheVbAhpxz_Y
Message-ID: <CAHfVqdWDaLEKYMw-ZfkYvKLoSJ-_HOm3X9hUUhEf7ReBbOi__w@mail.gmail.com>
Subject: Re: [PATCH v4 net-next 3/7] selftests/ptp: Add testptp support for
 attributes ioctls
To: Arthur Kiyanovski <akiyano@amazon.com>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	Richard Cochran <richardcochran@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Miroslav Lichvar <mlichvar@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Wen Gu <guwen@linux.alibaba.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, David Woodhouse <dwmw@amazon.com>, 
	Yonatan Sarna <ysarna@amazon.com>, Zorik Machulsky <zorik@amazon.com>, 
	Alexander Matushevsky <matua@amazon.com>, Saeed Bshara <saeedb@amazon.com>, Matt Wilson <msw@amazon.com>, 
	Anthony Liguori <aliguori@amazon.com>, Nafea Bshara <nafea@amazon.com>, 
	Evgeny Schmeilin <evgenys@amazon.com>, Netanel Belgazal <netanel@amazon.com>, Ali Saidi <alisaidi@amazon.com>, 
	Benjamin Herrenschmidt <benh@amazon.com>, Noam Dagan <ndagan@amazon.com>, David Arinzon <darinzon@amazon.com>, 
	Evgeny Ostrovsky <evostrov@amazon.com>, Ofir Tabachnik <ofirt@amazon.com>, 
	Amit Bernstein <amitbern@amazon.com>, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, shuah@kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, vadim.fedorenko@linux.dev
Content-Type: text/plain; charset="UTF-8"

>                 " -t val     shift the ptp clock time by 'val' seconds\n"
>                 " -T val     set the ptp clock time to 'val' seconds\n"
>                 " -x val     get an extended ptp clock time with the desired number of samples (up to %d)\n"
> +               " -a val     get extended timestamps with attributes (error_bound,\n"
timestamps -> ptp clock to be consistent
also, have you considered making the "-a" additional flag to -x and -A
instead of an exclusive option?


> +               printf("sample #%2d: unknown clock %d %s: %lld.%09u\n",
> +                      sample_num, clockid, when, sec, nsec);
In the case of an unknown clock, will the additional parameters
(when/sec/..) be useful?

>                 break;
>         }
>  }
> @@ -188,6 +193,7 @@ int main(int argc, char *argv[])
>         struct ptp_sys_offset *sysoff;
>         struct ptp_sys_offset_extended *soe;
>         struct ptp_sys_offset_precise *xts;
> +       struct ptp_sys_offset_attrs *attrs_data;
>
>         char *progname;
>         unsigned int i;
> @@ -208,7 +214,9 @@ int main(int argc, char *argv[])
>         int list_pins = 0;
>         int pct_offset = 0;
>         int getextended = 0;
> +       int getextendedattrs = 0;
>         int getcross = 0;
> +       int getcrossattrs = 0;
>         int n_samples = 0;
>         int pin_index = -1, pin_func;
>         int pps = -1;
> @@ -226,7 +234,8 @@ int main(int argc, char *argv[])
>
>         progname = strrchr(argv[0], '/');
>         progname = progname ? 1+progname : argv[0];
> -       while (EOF != (c = getopt(argc, argv, "cd:e:E:f:F:ghH:i:k:lL:n:o:p:P:rsSt:T:w:x:Xy:z"))) {
> +       while (EOF != (c = getopt(argc, argv,
> +                                 "a:Acd:e:E:f:F:ghH:i:k:lL:n:o:p:P:rsSt:T:w:x:Xy:z"))) {
>                 switch (c) {
>                 case 'c':
>                         capabilities = 1;
> @@ -311,9 +320,22 @@ int main(int argc, char *argv[])
>                                 return -1;
>                         }
>                         break;
> +               case 'a':
> +                       getextendedattrs = atoi(optarg);
> +                       if (getextendedattrs < 1 ||
> +                           getextendedattrs > PTP_MAX_SAMPLES) {
> +                               fprintf(stderr,
> +                                       "number of extended attrs timestamp samples must be between 1 and %d; was asked for %d\n",
> +                                       PTP_MAX_SAMPLES, getextendedattrs);
> +                               return -1;
> +                       }
> +                       break;
>                 case 'X':
>                         getcross = 1;
>                         break;
> +               case 'A':
> +                       getcrossattrs = 1;
> +                       break;
>                 case 'y':
>                         if (!strcasecmp(optarg, "realtime"))
>                                 ext_clockid = CLOCK_REALTIME;
> @@ -367,6 +389,8 @@ int main(int argc, char *argv[])
>                                "  %d programmable pins\n"
>                                "  %d cross timestamping\n"
>                                "  %d adjust_phase\n"
> +                              "  %d extended_attrs\n"
> +                              "  %d precise_attrs\n"
>                                "  %d maximum phase adjustment (ns)\n",
>                                caps.max_adj,
>                                caps.n_alarm,
> @@ -376,6 +400,8 @@ int main(int argc, char *argv[])
>                                caps.n_pins,
>                                caps.cross_timestamping,
>                                caps.adjust_phase,
> +                              caps.extended_attrs,
> +                              caps.precise_attrs,
>                                caps.max_phase_adj);
>                 }
>         }
> @@ -648,6 +674,49 @@ int main(int argc, char *argv[])
>                 free(soe);
>         }
>
> +       if (getextendedattrs) {
> +               attrs_data = calloc(1, sizeof(*attrs_data) +
> +                                   getextendedattrs * sizeof(struct ptp_timestamp));
> +               if (!attrs_data) {
> +                       perror("calloc");
> +                       return -1;
> +               }
> +
> +               attrs_data->request.num_samples = getextendedattrs;
> +               attrs_data->request.clock_id = ext_clockid;
> +
> +               if (ioctl(fd, PTP_SYS_OFFSET_EXTENDED_ATTRS, attrs_data)) {
> +                       perror("PTP_SYS_OFFSET_EXTENDED_ATTRS");
> +               } else {
> +                       printf("extended attrs timestamp request returned %d samples\n",
> +                              getextendedattrs);
> +
> +                       for (i = 0; i < getextendedattrs; i++) {
> +                               struct ptp_timestamp *ts = &attrs_data->timestamps[i];
> +
> +                               printf("  sample #%u:\n", i);
> +                               printf("    sys before: %lld ns\n",
> +                                      (long long)ts->pre_systime.sys_time);
> +                               printf("    phc time:   %lld.%09u\n",
> +                                      ts->devtime.device_time.sec,
> +                                      ts->devtime.device_time.nsec);
> +                               if (ts->devtime.attrs.valid & PTP_ATTRS_VALID_ERROR_BOUND)
> +                                       printf("    error_bound: %u ns\n",
> +                                              ts->devtime.attrs.error_bound);
in case device doesn't report error bound, I think it's better to
print explicit message
