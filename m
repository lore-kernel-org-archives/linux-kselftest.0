Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF643C10BA;
	Thu, 10 Sep 2026 08:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029100; cv=none; b=bKjvoiffqynHaDHZ9rtsaAIL6EIOB3ODhpjG2XtbQWeBH8L8/vQvadxAmSk0YzpAaOQN94MtfKD1kRLhBiKivBrAt/FEFvtg5ZH3YPblyOvAgUdiAq/gpbKaaQ8W+6AvXewATWO+l91wL+6xFPvSXFgYlg8Tlb79pH8Be27LPAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029100; c=relaxed/simple;
	bh=CIGQHvLLoACXjfixLkZL3B8Gbv5ycX8kffcfuKagc0E=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f5KmZBnx/2FDIi8mZmdCStD5o5Aeh9Rm1yaubF2/5aDG95ExMH8pUz7bgLZElBEejF2euRv3Q1Ybl/ju2jAY5G5ykGddLmxhOhoszsYSun10BYp3x1LqmYT6zgveiVbhS6di/KBUt5espLIUmRddENrahdN5o8NjSr0GFWKVJ6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jbs9L774; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jbs9L774"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E0B1F000FF;
	Thu, 10 Sep 2026 08:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789029098;
	bh=PHX2CV6L+xADuSOjNgypR5thAFREjphJZG3812TT6xk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Jbs9L774dWGD9ZHMlCbeL49FX9vlK2YEyc0hEWEdmTcclKioEhnxT+Pw1LsNoDCmD
	 qcvDnny9irKur50klFnQDq9WEuGJYCZIQGv0qpGsm5buR0hBQC/04l1gxySODQFoq9
	 QKEF0dhrqpYKtSDWVha8SSsQQphJAYgczpsjJut5CvxrCzTgq6JgotAQKO2zOKPPK/
	 yfeu8PCxGg0UPuJhW9VaR8y90OOEIlJFrCdbMX45206oswgm1b394Q4RY7AgOc41b9
	 iSzhT3MZ5pNJekxuiXqIauGaTJKRqegxGlRI+7DP/h2llV9k0AQZrOxDFJ0T0OcunZ
	 QGeBC5Sp1lqxQ==
Subject: Re: [PATCH v7 net-next 7/7] net: ena: Implement gettimexattrs64
 callback for PTP attributes
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
Date: Thu, 10 Sep 2026 08:31:36 +0000
Message-ID: <178902909615.219967.17316162800507267391@kernel.org>
In-Reply-To: <20260909073136.12863-8-akiyano@amazon.com>
References: <20260909073136.12863-8-akiyano@amazon.com>
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

- [Medium] ena_phc_gettimexattrs64()
  (drivers/net/ethernet/amazon/ena/ena_phc.c:57-60) unconditionally…
- [Low] ena_phc_gettimexattrs64()
  (drivers/net/ethernet/amazon/ena/ena_phc.c:28-62) is a verbatim…

--

net: ena: Implement gettimexattrs64 callback for PTP attributes

Adds ena_phc_gettimexattrs64() to the ENA PHC code and registers it in
ena_ptp_clock_info so the PTP_SYS_OFFSET_EXTENDED_ATTRS ioctl is supported.
The new callback reports the device error_bound value and sets the
corresponding valid bit; other attributes are left unreported.

A couple of questions below.

> diff --git a/drivers/net/ethernet/amazon/ena/ena_phc.c b/drivers/net/ethernet/amazon/ena/ena_phc.c
> index 2bcb5af564e2..725c36fe3f6e 100644
> --- a/drivers/net/ethernet/amazon/ena/ena_phc.c
> +++ b/drivers/net/ethernet/amazon/ena/ena_phc.c
> @@ -25,6 +25,43 @@ static int ena_phc_feature_enable(struct ptp_clock_info *clock_info,
>  	return -EOPNOTSUPP;
>  }
>  
> +static int ena_phc_gettimexattrs64(struct ptp_clock_info *clock_info,
> +				   struct timespec64 *ts,
> +				   struct ptp_system_timestamp *sts,
> +				   struct ptp_clock_attrs *att)
> +{
> +	struct ena_phc_info *phc_info =
> +		container_of(clock_info, struct ena_phc_info, clock_info);
> +	u32 error_bound_nsec;
> +	unsigned long flags;
> +	u64 timestamp_nsec;
> +	int rc;
> +
> +	spin_lock_irqsave(&phc_info->lock, flags);
> +
> +	ptp_read_system_prets(sts);
> +
> +	rc = ena_com_phc_get_timestamp(phc_info->adapter->ena_dev,
> +				       &timestamp_nsec,
> +				       &error_bound_nsec);
> +
> +	ptp_read_system_postts(sts);
> +
> +	spin_unlock_irqrestore(&phc_info->lock, flags);
> +
> +	if (rc)
> +		return rc;
> +
> +	*ts = ns_to_timespec64(timestamp_nsec);
> +

[Severity: Low]
This isn't a bug, but the body above is a verbatim copy of
ena_phc_gettimex64(): same container_of(), same
spin_lock_irqsave(&phc_info->lock, flags) / ptp_read_system_prets() /
ena_com_phc_get_timestamp() / ptp_read_system_postts() /
spin_unlock_irqrestore() sequence, same rc handling and same
*ts = ns_to_timespec64(timestamp_nsec).

Since ena_phc_gettimexattrs64() already tolerates att == NULL (and is in
fact called with sts == NULL and att == NULL from ptp_clock_gettime() in
drivers/ptp/ptp_clock.c), could ena_phc_gettimex64() simply become:

	static int ena_phc_gettimex64(struct ptp_clock_info *clock_info,
				      struct timespec64 *ts,
				      struct ptp_system_timestamp *sts)
	{
		return ena_phc_gettimexattrs64(clock_info, ts, sts, NULL);
	}

Passing a non-NULL error_bound to ena_com_phc_get_timestamp() has no side
effect beyond storing the value, since that function guards the store with
if (error_bound). Keeping two copies of the PHC doorbell/poll sequence means
a later fix can land in only one of them.

> +	if (att) {
> +		att->error_bound = error_bound_nsec;
> +		att->valid |= PTP_ATTRS_VALID_ERROR_BOUND;
> +	}

[Severity: Medium]
Is PTP_ATTRS_VALID_ERROR_BOUND being advertised here without a device
capability gate?

The only capability check in the driver is in ena_com_phc_config(), which
accepts:

	/* Supporting only PHC V0 (readless mode with error bound) */
	if (get_feat_resp.u.phc.version != ENA_ADMIN_PHC_FEATURE_VERSION_0) {

ENA_ADMIN_PHC_FEATURE_VERSION_0 is 0, which is the same numeric value that
pre-series firmware reports for the old name ENA_ADMIN_PHC_TYPE_READLESS.
The preceding commit only renames u8 type to u8 version and re-documents 0
as "readless with error_bound"; it also carves u32 error_bound out of the
previously reserved (must-be-zero) bytes of struct ena_admin_phc_resp.

So can a PHC-capable device whose firmware predates error_bound still pass
that version check, leave the DMA bytes at zero, and have
ena_com_phc_get_timestamp() copy that zero out:

	/* PHC timestamp value is returned to the caller */
	*timestamp = resp->timestamp;
	if (error_bound)
		*error_bound = resp->error_bound;

In that case userspace receives error_bound = 0 ns with the validity bit
asserted, i.e. it is told the timestamp is exact, rather than being told the
attribute is unavailable, which is what the valid bitmask exists to express.

The device-side error signal does not seem to help here either:
ENA_ADMIN_PHC_ERROR_FLAG_ERROR_BOUND (checked via ENA_PHC_ERROR_FLAGS) is a
new flag that error_bound-unaware firmware would never set.

Would it make sense to gate the valid bit on a distinct feature version
value or an explicitly advertised device bit? Alternatively, if every
PHC-capable ENA firmware that reports version 0 does populate error_bound
and no older firmware exists in the field, could the commit message state
that?

> +
> +	return 0;
> +}
> +
>  static int ena_phc_gettimex64(struct ptp_clock_info *clock_info,
>  			      struct timespec64 *ts,
>  			      struct ptp_system_timestamp *sts)

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909073136.12863-1-akiyano%40amazon.com
