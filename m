Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AC63DD51E
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 12:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780401668; cv=none; b=m+PyceHEEe0FjrRjCCrHnPAXJ9supEzpgtX6KKSuzjRNRBawadqyGt4rNUr5dx61EAmY/SMQ10FXJDBemEo7jeO0MWNlnalI2/l2XUpP0M/CnymKA6/zFr7uv3PRbvsGv9iH50aapqs4gAhEYKDHkOMr9o2scjw1mgeCa4M9pQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780401668; c=relaxed/simple;
	bh=5vvYoMF+qfsljw9HoOnQexBYxvBiVq1OjsZS0Xfmuzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9E8rHfnEXVZPVorMjHRsMjpONENTktxo5IWtVBOC5ppv89hMXRmK42i3FvjKvaNk2GL4T599w35ZGirdrnp9upWUtx3XzSVUzBEkHTnYJMlsOJuRwYw65dU2F2bkmZPLaKS5W8hXlL6yevBeR/tLEYHjBUlSL8WGfDFqjF3mjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/uImSdm; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/uImSdm"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45eec22fab7so2754180f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 05:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401664; x=1781006464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QbmaePIzUDbGyOJEyAqfLgC05MeRGYdaKnUjikSR2fc=;
        b=A/uImSdmsyyDa++KGAM8XzzVnYR8FlPRB2UD+nzqWLrx8mKgyeZqLvhOyH33Bbz1ie
         5VR5twjmT54WfskdKur5LFX8KOzBz6A8lZmfCuEzifOmp/H8bQP8Cp8hv70qogQXAN0n
         lcqRUGy9dijzCGRq5yMB3aHDd49rHic3v93agoaMZXY02UT48cKwJ9FlaqIP4+6hevyS
         ZeOfXeGzE2wPfCawxy36d/MJluSskTw7YUVQOeQttukkG3y4Dl5ylIyPMoWrb9f5xBTi
         JjkELo4Mox1gWtbyqvqRecf3eyUS6q7Oa35tJawZMg/oGFFUE9BtU28wwcVQ9qWY1sVf
         uUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401664; x=1781006464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbmaePIzUDbGyOJEyAqfLgC05MeRGYdaKnUjikSR2fc=;
        b=RUrt3MwdNcTS552DndNbsw0TGQS75qdetaNElK34gOIdzSi4Kg/4ODQNi5Qq/CKi7W
         ky6I8ogaYH0bgF+jBWPtkYUwTOmv0PLjatHksBURJXUzFnPUEYE0yNMd/QNFt30lzUJE
         FuzZgb59m3Acz2SlOzvXm/JBhUXABfoVBhR4+5j6/Qi3Rpmoa+FopRU2ICxdAgdcTEjn
         hHhS0x4H7yegnEcopRLgYwqG80+7o5qz69xerKj9UeWCdQ8qsTpeJLD2GNbbXPRdgOnY
         phAg5mIvRgGK/wDQv/SQhNyX2v6Ycw2KkIaMvNKynHGN7IV1zgs4xo12e2G9ySXL2n+u
         l5rg==
X-Forwarded-Encrypted: i=1; AFNElJ/ADToCCMrMtTvWEzB7+Br3/saKQz8tlCTn5HQ/jOxxRiMCcl3t111zbzDBbpzsIrDZvRyhh6oNsDxKTzm4YW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcdCPf7WfuJOv6/WJ3cHUhHV7jnSGBJZXcGg1Kj1jBemPQKBpn
	rF5YB6aeqm25P/8wS5OEcXjyN8waYuEynLvnXMYqPbXl6WgFFL4XT4Jr
X-Gm-Gg: Acq92OHFqoHUfwbwSfrBeSAZdoMte8ZfLB7L6fwwog/GqHtEq/dp8sfmNqy83mJn3pN
	PX0ZnIQ4qW7N+mG8lSDBRcqiEtItCKQoSzxN3JbyOACGBzh4NywB5prlFW+r/URBA5qR8DqdQuX
	7Comj2xQNgTrPz5FKJKrT9yWyfkim0QTDwILJrLXvFShv2Q4Ea3kX3SWsoy1nbeoPxLPxiJ/1UV
	Oq2u5pVa/puXKRNXeBhtkRu+9Vr2/IA8ksKGyiwzw/oRD+NBgYCw6Z/4hNXM17FwE6gURCZg+QF
	z/bsjsfMs0rNVqEJJ2PxNCuoDt6UwY2gF+P+fXOS4JZI1ssr7fAUH8uXbQH658F0fWbgirjEbzZ
	QlS0/i4Yjty3f+E3qGPKptOmoTuzyM1lHwUyudoMV9swgw//GihSstdn/QH/BWf2bd9/yOwA1aZ
	QXP1CVRgLuyPE5NbTsmZJ7rnGlqsKnKeK8iod1WQm3+By+jZdwvgpsBfRJWtcbMHDZnrjBEFouF
	mR53aknMivwO7lQyglp4orpH526gt6x3fT6TIxIoCZhILc=
X-Received: by 2002:adf:e510:0:b0:45e:f271:5019 with SMTP id ffacd0b85a97d-45ef6b1f0d2mr24998882f8f.14.1780401663495;
        Tue, 02 Jun 2026 05:01:03 -0700 (PDT)
Received: from cedric-laptop (2a02-1810-cd14-9200-ca7b-4123-f99d-3775.ip6.access.telenet.be. [2a02:1810:cd14:9200:ca7b:4123:f99d:3775])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef356b129sm42075516f8f.32.2026.06.02.05.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 05:01:02 -0700 (PDT)
Date: Tue, 2 Jun 2026 14:00:53 +0200
From: Cedric Jehasse <cedric.jehasse@gmail.com>
To: Luke Howard <lukeh@padl.com>
Cc: Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bridge@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	Max Hunter <max@huntershome.org>, Kieran Tyrrell <kieran@sienda.com>
Subject: Re: [PATCH net-next v2 5/6] net: dsa: mv88e6xxx: MQPRIO support
Message-ID: <t44kmhk6gqxnwhdvo7svouexwelwsya7zgukpbv3cxpfsmutqa@y3rjoj3tvqce>
References: <20260602-mv88e6xxx-8021qat-mqprio-v2-0-72be14522e7c@padl.com>
 <20260602-mv88e6xxx-8021qat-mqprio-v2-5-72be14522e7c@padl.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-mv88e6xxx-8021qat-mqprio-v2-5-72be14522e7c@padl.com>

On Tue, Jun 02, 2026 at 10:43:50AM +1000, Luke Howard wrote:
> +static int mv88e6xxx_setup_tc_mqprio(struct dsa_switch *ds, int port,
> +				     struct tc_mqprio_qopt_offload *mqprio)
> +{
> +	struct netlink_ext_ack *extack = mqprio->extack;
> +	u8 ieee_pri_map[IEEE_8021Q_MAX_PRIORITIES];
> +	struct mv88e6xxx_chip *chip = ds->priv;
> +	struct mv88e6xxx_tc_policy *pol;
> +	enum mv88e6xxx_tc_mode tc_mode;
> +	struct net_device *user;
> +	bool can_update_pol;
> +	bool per_port_pol;
> +	int num_tc, err;
> +
> +	if (!dsa_is_user_port(ds, port))
> +		return -EINVAL;
> +
> +	num_tc = mv88e6xxx_validate_tc_mqprio(chip, mqprio, &tc_mode, ieee_pri_map);
> +	if (num_tc < 0)
> +		return num_tc;
> +
> +	user = dsa_to_port(ds, port)->user;
> +
> +	per_port_pol = (tc_mode == MV88E6XXX_TC_MODE_QPRI &&
> +			chip->info->ops->port_ieee_pri_map);
> +
> +	mv88e6xxx_reg_lock(chip);
> +
> +	pol = &chip->tc_policy;
> +
> +	if (num_tc && pol->tc_mode && pol->tc_mode != tc_mode) {
> +		NL_SET_ERR_MSG_MOD(extack, "all switch ports must use the same MQPRIO mode");
> +		err = -EOPNOTSUPP;
> +		goto err_unlock;
> +	}
> +
> +	can_update_pol = per_port_pol ||
> +			 !pol->tc_port_mask || pol->tc_port_mask == BIT(port);
> +	if (!can_update_pol && num_tc &&
> +	    !mv88e6xxx_tc_mode_map_equal(chip, tc_mode, ieee_pri_map)) {
> +		NL_SET_ERR_MSG_MOD(extack, "only a single priority mapping supported per switch");
> +		err = -EOPNOTSUPP;
> +		goto err_unlock;
> +	}
> +
> +	err = mv88e6xxx_mqprio_netdev_set_tc(user, &mqprio->qopt, num_tc);
> +	if (err)
> +		goto err_reset_tc;
> +
> +	if (can_update_pol) {
> +		const u8 *map = num_tc ? ieee_pri_map : NULL;
> +
> +		if (per_port_pol)
> +			err = mv88e6xxx_set_port_ieee_pri_map(chip, port, map);
> +		else
> +			err = mv88e6xxx_set_ieee_pri_map(chip, map);

In case of per port priority mapping, i don't know if this is working as
expected, as the IEEE priority mapping is done at ingress.
Eg. i think if MQPRIO channel mode is used to configure a pcp to queue mapping
on port 1 and a different mapping on port 2. Traffic received on port 1 that
gets forwarded to port 2 and egresses port 2 will end up in the queue
configured by the mapping on port 1. As mqprio is an egress qdisc, i don't
think that's expected.

I have a patch that hasn't been submitted to the mailing list yet which
implements support for the dcb app pcp-prio command. This is also done by
configuring the IEEE priority mapping table.

Cedric

