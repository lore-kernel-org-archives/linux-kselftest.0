Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A0E39A048;
	Thu, 10 Sep 2026 08:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029092; cv=none; b=k2SYps38vKZMhPU/twd5q7gkZfbueuMvsGOSJIvmWbNSnq+N5Zs7gkri/D2VSVW79geRt9WVClFMM20xi1QYgpZe1IzoVzodSfLJyCEyv8kFaf0UD+4FmSPIURObm9Ul/5h7tjXaqtfqqyHeinoC7tvJk2GM6Lwzu6tCwP6/J3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029092; c=relaxed/simple;
	bh=mLcrICJKKsg8MiQvwUmp+sFA/YH/tFiA7Fh3Kbai7+E=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Oif7SOSUVgIHebzgMyweGh1Fj1PSao7zVYrYhiC320isHvmdfZvw7Az5V56ZF6yayKN5aBK8oldhHVgA5dWGEZTHKbbNRbpMGfmrjETHXb6ACAEAYzkzJBGz4nuyk1oi9G4BLcXqH4DEs/FnL5cg5NIDamPgK3oJWoLGLuT4wnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dgJIeGzL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dgJIeGzL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBFA1F00893;
	Thu, 10 Sep 2026 08:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789029090;
	bh=+iLAfbw4OrHKaFaXdarlWGpCzFIWsK0QsDLpfov8MUo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dgJIeGzLhTNkwadv5mN14pguuuR8Azhs2U0xxJVcFjb4WyN1/4yPb5HPViCFmTv1a
	 JpPo3OdMgLrKJnJV7RHUuU8GEwQ9vpbX1/8ezMewvsyA5reL8AmTHo2U+3EYu3v7R8
	 rrB5EJDrwKqUvCdUzCt9MJw47L3eRl/tpgt14zxO3bKDAZvtBSaEYUL1Weyq097BXt
	 mk5C3qMFS0m05Ff4dqVpYSX7mjgwplFftNSOVujVDJNih7mNBpOXOLFOuSFBTz2wFw
	 tPO581bY9tn4/Fi7wfNCICltu+r+DenvajzAaxQB8QCmrN89LJgouPGKxwx4ZGeAB+
	 /RwVOiT5YvflA==
Subject: Re: [PATCH v7 net-next 3/7] selftests/ptp: Add testptp support for
 attributes ioctls
From: netdev-bot+sashiko@kernel.org
To: akiyano@amazon.com
Cc: davem@davemloft.net, kuba@kernel.org, richardcochran@gmail.com,
 netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 dwmw2@infradead.org, tglx@linutronix.de, mlichvar@redhat.com,
 maciek@machnikowski.net, andrew+netdev@lunn.ch, andrew@lunn.ch,
 cjubran@nvidia.com, guwen@linux.alibaba.com, xuanzhuo@linux.alibaba.com,
 dwmw@amazon.com, ysarna@amazon.com, zorik@amazon.com, matua@amazon.com,
 saeedb@amazon.com, msw@amazon.com, aliguori@amazon.com, nafea@amazon.com,
 evgenys@amazon.com, netanel@amazon.com, alisaidi@amazon.com, benh@amazon.com,
 ndagan@amazon.com, darinzon@amazon.com, evostrov@amazon.com, ofirt@amazon.com,
 amitbern@amazon.com, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, shuah@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, horms@kernel.org, bhelgaas@google.com,
 vadim.fedorenko@linux.dev, dwmw@amazon.co.uk
Date: Thu, 10 Sep 2026 08:31:28 +0000
Message-ID: <178902908829.219967.3668712303469402253@kernel.org>
In-Reply-To: <20260909073136.12863-4-akiyano@amazon.com>
References: <20260909073136.12863-4-akiyano@amazon.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 1

- [Medium] The new `-x N -a` (PTP_SYS_OFFSET_EXTENDED_ATTRS) print loop
  in `main()` (tools/testing/selftests/ptp/testptp.c lines 671-722)…
- [Low] In `main()` of tools/testing/selftests/ptp/testptp.c, the new
  `-a` modifier is accepted and sets `use_attrs = 1` (line 327-329) but…

--

selftests/ptp: Add testptp support for attributes ioctls

This adds a "-a" modifier to testptp so that the new
PTP_SYS_OFFSET_EXTENDED_ATTRS and PTP_SYS_OFFSET_PRECISE_ATTRS ioctls can
be exercised alongside the existing -x and -X requests. It also prints the
new extended_attrs/precise_attrs capabilities and reports unrecognized
clock ids in print_system_timestamp().

A couple of questions below.

> diff --git a/tools/testing/selftests/ptp/testptp.c b/tools/testing/selftests/ptp/testptp.c
> index d603d9f82237..62b1d0340d71 100644
> --- a/tools/testing/selftests/ptp/testptp.c
> +++ b/tools/testing/selftests/ptp/testptp.c
> @@ -148,6 +148,8 @@ static void usage(char *progname)
>  		" -T val     set the ptp clock time to 'val' seconds\n"
>  		" -x val     get an extended ptp clock time with the desired number of samples (up to %d)\n"
>  		" -X         get a ptp clock cross timestamp\n"
> +		" -a         also report clock quality attributes (error_bound,\n"
> +		"            status, timescale); use together with -x or -X\n"
>  		" -y val     pre/post tstamp timebase to use {realtime|monotonic|monotonic-raw}\n"
>  		" -z         test combinations of rising/falling external time stamp flags\n",
>  		progname, PTP_MAX_SAMPLES);

[ ... ]

> @@ -317,6 +324,9 @@ int main(int argc, char *argv[])
>  				return -1;
>  			}
>  			break;
> +		case 'a':
> +			use_attrs = 1;
> +			break;

[Severity: Low]
The usage text states that -a must be used "together with -x or -X", but is
that requirement enforced anywhere in main()?

Both new request blocks are gated on a companion option:

	if (getextended && use_attrs) {
	...
	if (getcross && use_attrs) {

and the two legacy blocks are now additionally gated on !use_attrs, so
"testptp -d /dev/ptp0 -a" (or -a combined with something unrelated like -k
or -g) issues no attrs ioctl, prints nothing about attributes, and exits 0.

main() already diagnoses the analogous dependency for -w and -H:

	if (pulsewidth >= 0 && perout < 0) {
		puts("-w can only be specified together with -p");
		return -1;
	}

	if (perout_phase >= 0 && perout < 0) {
		puts("-H can only be specified together with -p");
		return -1;
	}

Would it make sense to add the equivalent check for -a without -x or -X?

>  		case 'X':
>  			getcross = 1;
>  			break;

[ ... ]

> @@ -654,7 +668,60 @@ int main(int argc, char *argv[])
>  		free(soe);
>  	}
>  
> -	if (getcross) {
> +	if (getextended && use_attrs) {
> +		attrs_data = calloc(1, sizeof(*attrs_data) +
> +				    getextended * sizeof(struct ptp_timestamp));
> +		if (!attrs_data) {
> +			perror("calloc");
> +			return -1;
> +		}
> +
> +		attrs_data->request.num_samples = getextended;
> +		attrs_data->request.clock_id = ext_clockid;
> +
> +		if (ioctl(fd, PTP_SYS_OFFSET_EXTENDED_ATTRS, attrs_data)) {
> +			perror("PTP_SYS_OFFSET_EXTENDED_ATTRS");
> +		} else {
> +			printf("extended attrs timestamp request returned %d samples\n",
> +			       getextended);
> +
> +			for (i = 0; i < getextended; i++) {
> +				struct ptp_timestamp *ts = &attrs_data->timestamps[i];
> +
> +				printf("  sample #%u:\n", i);
> +				printf("    sys before: %lld ns\n",
> +				       (long long)ts->pre_systime.sys_time);
> +				printf("    sys_counter_id: %u\n",
> +				       ts->pre_systime.sys_counter_id);
> +				printf("    sys_counter:    %llu\n",
> +				       (unsigned long long)ts->pre_systime.sys_counter);
> +				printf("    phc time:   %lld.%09u\n",
> +				       ts->devtime.device_time.sec,
> +				       ts->devtime.device_time.nsec);
> +				if (ts->devtime.attrs.valid & PTP_ATTRS_VALID_ERROR_BOUND)
> +					printf("    error_bound: %u ns\n",
> +					       ts->devtime.attrs.error_bound);
> +				else
> +					printf("    error_bound: not reported\n");
> +				if (ts->devtime.attrs.valid & PTP_ATTRS_VALID_STATUS)
> +					printf("    status: %u\n",
> +					       ts->devtime.attrs.status);
> +				else
> +					printf("    status: not reported\n");
> +				if (ts->devtime.attrs.valid & PTP_ATTRS_VALID_TIMESCALE)
> +					printf("    timescale: %u\n",
> +					       ts->devtime.attrs.timescale);
> +				else
> +					printf("    timescale: not reported\n");
> +				printf("    sys after:  %lld ns\n",
> +				       (long long)ts->post_systime.sys_time);

[Severity: Medium]
Should the post snapshot print the counter fields too?

This loop prints pre_systime.sys_time, pre_systime.sys_counter_id and
pre_systime.sys_counter, but for the post snapshot only sys_time. It also
never prints sys_rawtime for either snapshot, although the kernel side fills
all four fields of both snapshots in ptp_sys_offset_extended_attrs():

drivers/ptp/ptp_chardev.c:ptp_sys_offset_extended_attrs() {
	...
	tstamp->post_systime.sys_time = ktime_to_ns(sts.post_sts.systime);
	tstamp->post_systime.sys_rawtime = ktime_to_ns(sts.post_sts.monoraw);
	ptp_fill_sys_counter(&tstamp->post_systime, sts.post_sts.cycles,
			     sts.post_sts.cs_id);
	...
}

The -X -a printer added in the same patch does surface those fields:

	printf("raw time:    %lld ns\n",
	       (long long)ts->systime.sys_rawtime);
	printf("sys_counter_id: %u\n",
	       ts->systime.sys_counter_id);
	printf("sys_counter:    %llu\n",
	       (unsigned long long)ts->systime.sys_counter);

so the two new consumers of struct ptp_sys_time disagree about which
returned fields are shown. As it stands, "-x N -a" output is identical
whether the post-read counter source is correctly identified or left at
zero.

The commit message says:

    Also print the system counter value and its identifier (sys_counter,
    sys_counter_id) returned in struct ptp_sys_time, so the counter source
    is visible

Does that hold for the extended path, given that post_systime.sys_counter
and post_systime.sys_counter_id are not printed?

> +			}
> +		}
> +
> +		free(attrs_data);
> +	}
> +

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909073136.12863-1-akiyano%40amazon.com
