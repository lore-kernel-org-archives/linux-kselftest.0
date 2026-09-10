Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4521C3BBFD3;
	Thu, 10 Sep 2026 08:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029097; cv=none; b=b2YFU3tGCswW0jK8ZOXSSdnCRV7fzQrsROam3lJfplfbzpyD8/vALsDudvBs79rqHAnVvwtQDxpDfQyYkmHZ6JYRhwhUDFl78HLBTO6Wei5WINFiG2mGCelePi9YQZlHwvzWmCmt++XWI1tUHULwP+MG2rEpVirMwNdvggRu2yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029097; c=relaxed/simple;
	bh=gpjLnXjMydggK4Orj4pZwXXB+mJp7VztavgGAtB9s1M=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OycF+U10ywODYqjaqFxT7qrU+a6m1Zfer7QLPzIDfU7x5WSsZDULe1KBj8VLhwzeCn9HaLQ6Wj2oyKjS4At/mTwzut8jvjAMZ1ZL5fz6tWNRveaoPAEcXYY/8AZ/GiQtxhKUOYMwSwEASwilsJ/HsYclcwKHvMXioq32frTotYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dEtafRVW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dEtafRVW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90C11F00893;
	Thu, 10 Sep 2026 08:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789029096;
	bh=F9PQQQfwAd99e37OOMNmqg5UAEc2Qtv9lx3+OiCRJKM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dEtafRVWc80TnHBpM6ZoitxJxx28+8/6FdkfnIbTt8/4beqq58LbeqN7Kn6vZN6I3
	 7YGxFQUYT3y2pn7hPT7IcGXB/oi2z0Hk5p51UGRylyFuJ+d8Tl1y/g+HLNvVN8iz5F
	 ceBT3e5WDO00yhyQmn6V+za9mEnKyyor3JWQ/C7bfsXubWZg4XUpjE5z1iDJCWey9f
	 a/kbEJnoA7tMdQ6XCjkxCn6IWWgQ4GsommW5wi7nghSdS9FteTXH1Pczl+ylZH2YuX
	 i61QZk08qDkXU78IIM0IpIgRXfYLxawsNrj6/YaD7biik4rtcesNVdE9RRwHLXr3xA
	 EPqogYxqiKTDA==
Subject: Re: [PATCH v7 net-next 5/7] net: ena: Update PHC admin interface for
 error bound support
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
Date: Thu, 10 Sep 2026 08:31:33 +0000
Message-ID: <178902909352.219967.7999203905301535022@kernel.org>
In-Reply-To: <20260909073136.12863-6-akiyano@amazon.com>
References: <20260909073136.12863-6-akiyano@amazon.com>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 1 · Low: 0

- [High] The commit message states it "Introduce[s] a feature version
  mechanism to indicate device supports error_bound", but the mechanism…
- [Medium] Version handshake is implemented as an exact-equality test
  against a field this patch documents as the device's *maximum*…

--

net: ena: Update PHC admin interface for error bound support

This extends the ENA admin definitions with an error_bound field in the PHC
response structure, replaces the PHC type enum with a PHC feature version
enum, and adds an error flag for error_bound retrieval failures.  The
handshake in ena_com_phc_config() is updated to request and check the new
version field.

> diff --git a/drivers/net/ethernet/amazon/ena/ena_admin_defs.h b/drivers/net/ethernet/amazon/ena/ena_admin_defs.h
> index 898ecd96b96a..2d132c4bc590 100644
> --- a/drivers/net/ethernet/amazon/ena/ena_admin_defs.h
> +++ b/drivers/net/ethernet/amazon/ena/ena_admin_defs.h
> @@ -128,12 +128,14 @@ enum ena_admin_get_stats_scope {
>  	ENA_ADMIN_ETH_TRAFFIC                       = 1,
>  };
>  
> -enum ena_admin_phc_type {
> -	ENA_ADMIN_PHC_TYPE_READLESS                 = 0,
> +enum ena_admin_phc_feature_version {
> +	/* Readless with error_bound */
> +	ENA_ADMIN_PHC_FEATURE_VERSION_0             = 0,
>  };

[Severity: High]
The commit message says:

  "Introduce a feature version mechanism to indicate device supports
   error_bound"

Can this mechanism actually indicate that?  ENA_ADMIN_PHC_FEATURE_VERSION_0
is 0, which is the same wire value as the removed ENA_ADMIN_PHC_TYPE_READLESS
(also 0), and ena_com_phc_config() still sends 0 in
feat_common.feature_version and still accepts a response value of 0:

	ret = ena_com_get_feature(ena_dev,
				  &get_feat_resp,
				  ENA_ADMIN_PHC_CONFIG,
				  ENA_ADMIN_PHC_FEATURE_VERSION_0);
	...
	if (get_feat_resp.u.phc.version != ENA_ADMIN_PHC_FEATURE_VERSION_0) {

So the bytes exchanged with the device look identical to the pre-patch
exchange, and firmware predating error_bound reports the same value as
firmware implementing it.  I did not find another discriminator either:
struct ena_admin_acq_common_desc carries no feature_version echo, and
enum ena_admin_aq_caps_id has no PHC/error-bound capability bit.

Does that matter for the new field?  error_bound is carved out of the
previously reserved bytes of the device-written DMA buffer
struct ena_admin_phc_resp:

> @@ -1224,7 +1226,10 @@ struct ena_admin_phc_resp {
>  	/* PHC timestamp (nsec) */
>  	u64 timestamp;
>  
> -	u8 reserved2[12];
> +	u8 reserved2[8];
> +
> +	/* Timestamp error limit (nsec) */
> +	u32 error_bound;
>  
>  	/* Bit field of enum ena_admin_phc_error_flags */
>  	u32 error_flags;

If a device that only implements the old readless layout never writes those
bytes, the driver reads the zero left by the coherent allocation (or stale
data) and ENA_ADMIN_PHC_ERROR_FLAG_ERROR_BOUND is never set.

Later in this series, ena_phc_gettimexattrs64() publishes that value to
userspace as authoritative:

	if (att) {
		att->error_bound = error_bound_nsec;
		att->valid |= PTP_ATTRS_VALID_ERROR_BOUND;
	}

which would report a validated 0 ns error bound on hardware that never
reported one.  Would giving the error_bound-capable format a distinct value
(for example VERSION_1) and accepting version >= the requested one keep old
and new firmware distinguishable?  Once value 0 is shipped as meaning
"readless with error_bound", that distinction cannot be recovered in
released kernels.

> @@ -1035,10 +1037,10 @@ struct ena_admin_queue_ext_feature_desc {
>  };
>  
>  struct ena_admin_feature_phc_desc {
> -	/* PHC type as defined in enum ena_admin_get_phc_type,
> -	 * used only for GET command.
> +	/* PHC version as defined in enum ena_admin_phc_feature_version,
> +	 * used only for GET command as max supported PHC version by the device.
>  	 */
> -	u8 type;
> +	u8 version;
>  
>  	/* Reserved - MBZ */
>  	u8 reserved1[3];

[ ... ]

> diff --git a/drivers/net/ethernet/amazon/ena/ena_com.c b/drivers/net/ethernet/amazon/ena/ena_com.c
> index 297fb36ab8c1..40d1fd64bc34 100644
> --- a/drivers/net/ethernet/amazon/ena/ena_com.c
> +++ b/drivers/net/ethernet/amazon/ena/ena_com.c
> @@ -1694,10 +1694,11 @@ int ena_com_phc_config(struct ena_com_dev *ena_dev)
>  		return ret;
>  	}
>  
> -	/* Supporting only readless PHC retrieval */
> -	if (get_feat_resp.u.phc.type != ENA_ADMIN_PHC_TYPE_READLESS) {
> +	/* Supporting only PHC V0 (readless mode with error bound) */
> +	if (get_feat_resp.u.phc.version != ENA_ADMIN_PHC_FEATURE_VERSION_0) {
>  		netdev_err(ena_dev->net_device,
> -			   "Unsupported PHC type, error: %d\n",
> +			   "Unsupported PHC version (0x%X), error: %d\n",
> +			   get_feat_resp.u.phc.version,
>  			   -EOPNOTSUPP);
>  		return -EOPNOTSUPP;
>  	}

[Severity: Medium]
Should this be an ordering test rather than an equality test?  The new
comment on the same byte in struct ena_admin_feature_phc_desc describes it
as a ceiling:

	/* PHC version as defined in enum ena_admin_phc_feature_version,
	 * used only for GET command as max supported PHC version by the device.
	 */
	u8 version;

With that meaning, firmware that advertises a maximum of 1 while still
serving the V0 layout the driver explicitly asked for through
feat_common.feature_version = ENA_ADMIN_PHC_FEATURE_VERSION_0 fails the
"!=" test, ena_com_phc_config() returns -EOPNOTSUPP, and ena_phc_init()
takes the err_ena_com_phc_config path (ena_com_phc_destroy(),
ena_phc_enable(adapter, false), ena_devlink_disable_phc_param()), leaving
PHC/PTP unavailable on hardware that supports the requested interface.

The two comments in ena_admin_defs.h also seem to disagree about what the
device puts in the response.  ena_admin_get_set_feature_common_desc says:

	/* The driver specifies the max feature version it supports and the
	 * device responds with the currently supported feature version. The
	 * field is zero based
	 */
	u8 feature_version;

that is, a value clamped to what the driver requested, for which equality is
fine, while the new phc comment says the field carries the device maximum,
for which equality is wrong.  Which contract applies here?  If the device
clamps, could the new comment be reworded; if it reports its maximum, should
the check become something like

	if (get_feat_resp.u.phc.version < ENA_ADMIN_PHC_FEATURE_VERSION_0)

or an explicit minimum-required-version comparison?

For reference, the existing precedent in ena_com_get_max_queue_ext() uses
equality (get_resp.u.max_queue_ext.version != ENA_FEATURE_MAX_QUEUE_EXT_VER),
but that field's comment is only "/* version */" and never claims to be a
maximum.

Also, "Unsupported PHC version (0x%X)" prints a u8 with %X; would %u be
clearer here, matching the zero based version numbering?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909073136.12863-1-akiyano%40amazon.com
