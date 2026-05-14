Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAA23EE1D4
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 14:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778769321; cv=none; b=Rs8baVlN/1DHZOe4OQ4NPWlOkwRP5w95USxC4BejFz4vXBYE7U7a+3Aejg5XpcHpf6KN+PHOAUgxLpAiw3GXtvU+D1rHMysjQu3503McYYC31oq1nlINNfa0iK6+YgrljRe7AlsJvsPOdaTTC8lo8ROwfWDZwbfPROLF+7R/QWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778769321; c=relaxed/simple;
	bh=XFku5yzYOiAWkNshlk1RONi26wOOTtlVdHy89dww+pw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZi5CiCwUh9e7n0DMDxdXpi3lGbSC0tFcbrnO/VeMVRhzoO+fAkZ3K7aVZbYGro6GNvQoD7LoijiE4Mtjpb977T2urFsxu2Wuf6FE5+oN599sGVd/jlKGlN1Tndbx6KDq8kMOr2KML04yJ+em7TgZKHFMJzZ6mL+BmRPQwJCBIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbCH9f7V; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbCH9f7V"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48374014a77so70481475e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 07:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778769318; x=1779374118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s/Z4/+H7H1VVZuahgNCo5Gog19+W4f6AXOwm3rTI+q0=;
        b=EbCH9f7VXhl4iMUnJhrh4wHgMJ3qIumD8DgKlFca+XaCTqZNQeGFu78onpDkbWxcmd
         L/JYhdp0EhYSLqPhlraBZfLrUjTAhJ+P6OeE2esjOh/Vgwie4XH/Fr6F8DabbH6c+dHZ
         4tn7qbXi3LTQg60/BphAJRfJ13uAB3jkc47uKEtEvCGZUlH8q/X+AylcW8uUihIExvb7
         0+FeFiBnVHjWrstRvshoCqSJQCTQJ/F80wMejS/GBvTWY5Oi3jcNRiqjNy8E1ukSpFgf
         PIxpCRlFHwqf9RLpVPh/OPZyIxJzLTtcG/P0htmJJEFtX3HvFRL1U0lRTGG6HEj3QP3B
         97cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778769318; x=1779374118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/Z4/+H7H1VVZuahgNCo5Gog19+W4f6AXOwm3rTI+q0=;
        b=G3SI1KjkdEFjoteBC//cVw+ZANdE2Zv4Nojo7BwjVNW2wRK3MvWRn6dVfcch71WwYE
         Sl7xRDb9DOkjM2CzU9a29XEpsyCJhdF+kptPxNMc+vQvbN3cE2a1+xOYKbu5RT3Rfl3S
         M5vYetAYijd5gYb3a+4sm02RAcxMZS4ORX0ozcaXky94mXmlrLFA+ae+isvP5hBeBInK
         ruLhJnk+bxWlvTOJGOUidAOOHfPEeHQ2EwlaTQF4/IvhgWg8FJC9NsXaSggcowXY/dZA
         NGrs4ziv0i7MBj5SG3/HAwo9gmQJTdZsBEY8eDtaAJWikmrcYb5DL57SxCG6SL2yz+Vz
         1bpg==
X-Forwarded-Encrypted: i=1; AFNElJ+ZRNmzTMVt91gmmU9cDRIbxPMnROjDW7BwlRl40Awne5RZugcbLBNs/dZvWmhe7PxfSBfbNZodqW+hXYWHdmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtLfK9bbrhwvKng2H+zNC53nvwLQbH0mEDNAMfqwtRmtF4Kr2C
	uZTad+dVogLkThk3AVJzHERMa0p8moL6EElkOSMq4B+trrUnXFWHGnH+
X-Gm-Gg: Acq92OE/aEq1hO2Nzv0on7pk3lYgsxWoLpIpk6rXry3OVRiehreBJi0/AwyFFBW6SVY
	Vl1B3/luqpUubI8zYpYg2mz/SzxzdWjIshYswfhElsAD6hbXfwOCA4Ot5NxDVkgSPHHrVhxxM3J
	A/tQFzSmxz0NMyrWZQa5xpQ1c4502T5MUgq5JeQ60Yx0hssZK8SQU7VRhFfTSdCdiagkNz2b6mf
	ti2GkKe39E/bzpSwYQrE9wUhKAjrN3xR2AO2KLq6XodvrePbnb0BDN+KXSHhhzJKvryDATRnElb
	SPjakkwzvax+Bl94Z8xeTS9ZsFX2PUeGPGyktbS0DKC6MmtH7xJES9qOSzLh0V0PN43XUPpkn2E
	SqW4SjxE5fIhphsi9on6d6UhXEnu3nL08kDReSZ2bt3RYb5+8xCX7zgUy3cxx5Y71SoNV72qCCe
	txLx53+YmjZx1WPzkXwKH5BE8vlKfvCzpu13vo
X-Received: by 2002:a05:600c:46d2:b0:48f:c903:955f with SMTP id 5b1f17b1804b1-48fc9a4c78dmr120777745e9.23.1778769317918;
        Thu, 14 May 2026 07:35:17 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe46d8daesm1231655e9.9.2026.05.14.07.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:35:17 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 14 May 2026 16:35:15 +0200
To: Sasha Levin <sashal@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>, Breno Leitao <leitao@debian.org>,
	Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	gregkh@linuxfoundation.org, akinobu.mita@gmail.com,
	live-patching@vger.kernel.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <agXdowd63K8j43xi@krava>
References: <agHUp8ulaWJ75WU5@tiehlicka>
 <agHcFCRVSn5ra5Kc@laps>
 <agHeZPA3eHhJHIsQ@tiehlicka>
 <agHgDgwu8H9Opzpl@laps>
 <agHm9Vj7bPPCRS1g@tiehlicka>
 <agH7_QBPLWKTZucB@laps>
 <agH_bGUTvWm2h5g4@tiehlicka>
 <agIHsN9tiIHnVTeV@laps>
 <agINlnNN4ubZgyiN@tiehlicka>
 <agIbaeBQAr-RkqYc@laps>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agIbaeBQAr-RkqYc@laps>

On Mon, May 11, 2026 at 02:09:45PM -0400, Sasha Levin wrote:

SNIP

> > > Even if I'm okay with rebooting that often (and I really really would prefer
> > > not to), this doesn't solve the issues of a larger fleet of servers that can't
> > > just reboot that often.
> > > 
> > > What am I missing?
> > 
> > For one, you are missing more maintainers of code modification infrastructures.
> 
> Happy to add more, but I don't want to be too spammy. I'll add in the
> livepatching ML and the fault injection maintainer (I couldn't find a list).
> Please add any other folks/lists who you think might want to contribute to this
> discussion.

hi,
could you please add bpf (bpf@vger.kernel.org) to the loop?

thanks,
jirka
