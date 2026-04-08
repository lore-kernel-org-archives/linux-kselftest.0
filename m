Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0360128F935
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 09:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775638855; cv=none; b=bE2YUBwwIX/qhtVM2secmyy4yCJh7NPpIp6c8tl7wWyJLCvINjVS55KDXHAnxB/D7PxZAx9tj8LwtvvNCHHLQXLDZWKFTy7ruZUt2+KjkLTF6c/riEeMZjaOuV4x//r+tlWSgmcziw4mr3eI2wb5925YmzgocX29zhudeKNdLZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775638855; c=relaxed/simple;
	bh=ELi/SO9fCpI1hT2A641r7hbEx4I3MBwqp1WHI9r62rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDtC3YS/ISX7hWB//jyjpW4nmBxmOubB+4hoBy/ts41NS2nV8+v0yd/ryjOaSUMgDt32odhnvFI8kSPpQIzfPlNNT8UxfWpc1e0HyvnfGC3950W62tV2CAoDGEbdKmuWSlFNxAKONjMbQK/52oLTi/bTmnQSpKUPf4/jxt+wMcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=XN0WAFx7; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="XN0WAFx7"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cf3ee0fc1so431350f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 02:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1775638850; x=1776243650; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ELi/SO9fCpI1hT2A641r7hbEx4I3MBwqp1WHI9r62rw=;
        b=XN0WAFx7iG2ftBhZlqE8YxdKg5MkMfcXVGxvTiQAZvedNftcT4gpsHai3OmsSWnqC6
         oksBoua+/JA6huk1vAdcKfHnXxlrm7cR/RRY91thyWtBZ8WD3WIUW+CC2hH7k4pmbZ0W
         QVLaElUTxH1QLJeH2TAs//CHuhlN5YZsA5Ffd2LLic9JhESvMlJLJ2PfvnHHYtdT8hq4
         EWH39QXNg7WcP+YhBiI82SmNTJCbuxHUX01cWNORucglEV7VnOK5MYL0c2vTU0hPi8cc
         D8cR6bRrA1g0AjI8Ucirtsp/I98dzAD4sPjv0K2Uf6+etneJVOML4BsawVcZYjXqlf1L
         Veag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775638850; x=1776243650;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ELi/SO9fCpI1hT2A641r7hbEx4I3MBwqp1WHI9r62rw=;
        b=Ic1bZOZinOJSEi7ld4SWM5di7EZCxzxSdKQOUrjEP6vUlu0doplFUM0YxAE+4+MqFM
         KU8bBIe+nuBdL6L5t4P2um+Lvfe+i4wbcOHA7LCQlGz1DphCUwSiazxRwTYRAZvfCUMC
         0NsrpeKbU+rPGcDtYZL/3/pV98pAoBjsXPsbML2myejMcRE/PB+Q8e+GEXh1IhiDkb3I
         eVs5W5v/W+t6dZGVk9UrGIOJdTjXWk3gfXkjFQv6aX6F6ot7BLuOK5lrkflAHPLUPxcq
         wMUOcfOmybsMgxa5btvw/T3Os2UWx2soeuIvMk+HAKYH3BCmZsX5xHVNPhVOWwtw2HYC
         O0OA==
X-Forwarded-Encrypted: i=1; AJvYcCXd4RCuac1/7TyYDtoboQIQ1DlbhCcvKVizJssnSijkbNTSNdVvvP8DTurs3S3jd0W5rKW9FpEZdgRd3a9RiMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaA3k3lumC6lJ5N7p53lxAinkfVRNriZ/b9FIdBk5htVC/RaIE
	Q8+eG/8bmCRIOF/bRBV+mi9lEvBm78TxmkqNGuxnaP+4Xr9pbfndLmrZFTvHkvyszQo=
X-Gm-Gg: AeBDietxaHHl+ceONv/MdVo1keRf8d5zvfiFmvcjJbrl5Y41fEAGyIL5YWWlomp5voA
	/ZOD8zgKWq4sWrlhzkI7msOQv9If/J9OB3xeYFfFYnMG/TR2nWZfFy6a/PRdHN6pRBx1TpNpc0B
	I0kFO05aatxGw/KNDq3JPE/tfOHvNK+mqkxrULb2WzPHDtKJ0R9k4GqMH3CuOVgngJSpz5k5Phi
	PgkmUEGsolx8G4lJ+NsScQPtKolyWllv9DRa3c3CvQxYf6+PYX6Uc4uVo9ErI/zC5+g28RQRLej
	Y0diDdFin1hFzoh+1BccnKI5JoJejSLoaDAOWn4Y5ejNN+qPBtprayx7vPGeqpEIbEOkL+1MryA
	+w5x8rPQAezRQSIMbTwMQOgI8kF3wS0pZ3r0rqLR7m55pRplJrJhx61s5Nwz0JOrWYBBiXKO/xG
	r+juYnpmxs8EkjrVG2QS03B0Trpwss+Tc=
X-Received: by 2002:a05:6000:2384:b0:43d:384a:9e96 with SMTP id ffacd0b85a97d-43d384a9f5amr19228181f8f.4.1775638850006;
        Wed, 08 Apr 2026 02:00:50 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d2738sm58262922f8f.24.2026.04.08.02.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:00:49 -0700 (PDT)
Date: Wed, 8 Apr 2026 11:00:47 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Marc Harvey <marcharvey@google.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v5 00/10] Decouple receive and transmit
 enablement in team driver
Message-ID: <iuhx4kkkftjx52y5qo7w7p6rbxqakq2eu74r66xaepd2p2khjh@kdhljd2c2bpm>
References: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
 <utlz3oebjyd4lqp5pd4qdbth2kywxo4hrlrnwcxsx3br76fwfg@vy3tx5f3lv32>
 <CANkEMgn80UM7+mymVm21Q8yszgVeh029tvO+kHqmLGmf-2MU5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANkEMgn80UM7+mymVm21Q8yszgVeh029tvO+kHqmLGmf-2MU5g@mail.gmail.com>

Wed, Apr 08, 2026 at 02:12:35AM +0200, marcharvey@google.com wrote:
>On Tue, Apr 7, 2026 at 4:55 AM Jiri Pirko <jiri@resnulli.us> wrote:
>>
>> Mon, Apr 06, 2026 at 05:03:36AM +0200, marcharvey@google.com wrote:
>> >Allow independent control over receive and transmit enablement states
>> >for aggregated ports in the team driver.
>> >
>> >The motivation is that IEE 802.3ad LACP "independent control" can't
>> >be implemented for the team driver currently. This was added to the
>> >bonding driver in commit 240fd405528b ("bonding: Add independent
>> >control state machine").
>> >
>> >This series also has a few patches that add tests to show that the old
>> >coupled enablement still works and that the new decoupled enablement
>> >works as intended (4, 5, and 10).
>> >
>> >There are three patches with small fixes as well, with the goal of
>> >making the final decoupling patch clearer (1, 2, and 3).
>>
>> Looks fine to me now. Do you have libteam/teamd counterpart?
>
>I don't see a need for this to be used in any of the teamd runners.

Why do you need this then?
