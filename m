Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1B93D9DB0
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 06:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789886816; cv=none; b=MkwW6GKbjugxfmEDsaA6elEsnJCcVddBx64xU2LQmi3PBJGp60JWhx7IevJNqV58hRR4+vZCAWVIrQZdbWBOPXTJ0WZs0i0yfmV6jtK9rZvH4Asr7tUQfJuNICejKX9kJd1NHs9yMOQKLWLMMOdgsHLDV+Mq0OOY3jCsm0JkfXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789886816; c=relaxed/simple;
	bh=BKLHZGPBT1ra9/o3RySzPt6GWmDIvoVinMejtLiDi40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irTgK4vmoksI3Pxqav8aYha8bVapgFZM3ThiMcUy1oye/EWiQuq9NgZiYjdQLSeVEccPCU7UHkPIgvDMVlSu7ZKtxYhE2BbRhr7h0oU6D959d5mnMyDbuTvs66oFgtiBMM3LkbnHp8pGsEO9JaA1HoKDTNYwvsUiq7JU9hMFMOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=RpNCRhpU; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="RpNCRhpU"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b899413537so3019001e87.1
        for <linux-kselftest@vger.kernel.org>; Sat, 19 Sep 2026 23:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1789886809; x=1790491609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NaOoXMCD5+08vNUZK7B5Sw9F8Wgv/VWmCEv3fUCICio=;
        b=RpNCRhpUf0euCWxZSxksNGwOXQD3gwl/UtG3sxPbBNbzNGxr5u3l+CGvEAU7mCJ+8F
         vjIqubp10bYk/trSLHG45OKJxvBGEa60wYA93tY4egC2zN9EC843CAZlcoquZkkaQ4du
         CVowpR54SAsW5X89fmvmXqPVKBPKBUiOM7WbUzeTgheKnPxANcOhDRu3qaD3bQWAnyXy
         U8QJe4j6V+JraJ//LJz148kDobS2PZ1VmKWyzx1omeo/GkNi3p5MHVJvi4WQzYo6gGXL
         u9affkz8g7I5xbhmJVo15yQUkUvIWZHFFX1IHiGAIm/70YJc5RQ11HpfUeShZbotYTNo
         Twhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789886809; x=1790491609;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NaOoXMCD5+08vNUZK7B5Sw9F8Wgv/VWmCEv3fUCICio=;
        b=NSQP4keSFs1JICbCm/T4pRcLs0IAucDwS8++TNcD5uaMLxgcF3GUAnaEzfTjQIl8VX
         wgJnm96Gd+8Eui2G4NUcU2u1+OkfjajqfLsdWuR73KKjV0ka7anPIQCK6SKCXDjtl4Z5
         R3s1JbnWaOzVfTT4WoJeq5Rm1O+5OHAq0Q3viUTGAUxXagCgYZdg+kpzJeTHN+LicFWi
         BEyngkXBJC82UHV8ibO/lhHVWMl8JjQaE2tPGhn36JuAfhzK1XYSHpzUtimeS0ASKemi
         68+pkIx69bmw1LCbP8eMhgwQINVX9CAHLecTFzi3dyyWtA1WG1HvG8oJimTfO7He0Jee
         QJFA==
X-Forwarded-Encrypted: i=1; AKwUvByMHlWOU9LEsvDiw+Bmw1G0eQUw+j34/xiEYhHHjk5KZZpve+8jHhC0MznM8bxr6BbEjbscXI9/zPF+do3Dflk=@vger.kernel.org
X-Gm-Message-State: AFuF++kFmRAIJ/KwOXZbC/ARn128bFa+xomaLAGQLJBLX+IqAsBz95UR
	SU9b/zFQnukCKoUON6wMYdCSjaf0NkGANEBoV46szMVZKJ9H4oIHfcThowco8jbtg98=
X-Gm-Gg: AYBFou38bB3Kre3keUTLQh+ojSNNv9HiPZ+ktpbmh8DQaDqWvNmAs7BVsa7fzIQBlH9
	dOFDsp0TgYNvjaLEVPY6KT8yF4Au4FWHrRSVadcm3Gd3yF78MEAipqvdPO17mypxQNLdHiVf5Tx
	ieucEc5ueghamlaXcpvIjTl9tgVhUV56Lr/tX39BjmBdyhq1w76c3krz8RDf3QJ6J4FbO56UaS+
	xW1vxuZPwXoaGoVQyy4Ecikz0dhvoa/Lvh4gCApd5RcNVMr5oIqQuD7rLg5TuYGn1Z7lINrpuk3
	/Md25kgWrVKxLO0pXZryn34siuNC4swhmStGLy0Sn2U3DJp8NvDEKLQ1SQuPX3WiVdqUAg4PF8X
	TU9+QAlulAGisOG3VmDAf0gGHuagCGM3Dckty5BvT5jMKxh0ku5Jttph7334RCGa3nNPUHGkUEZ
	inZ1ffygPVh6fSgTuD7Zmb59AnhHFB7PtVmFOEGjeZD7cn5+rgpuQ4bWulfxq1Tt5g2BRaSxXVX
	sEZcy6f
X-Received: by 2002:a05:6512:3a8d:b0:5b8:c147:f363 with SMTP id 2adb3069b0e04-5b8c19618a8mr1949385e87.64.1789886809102;
        Sat, 19 Sep 2026 23:46:49 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c88d537bsm891722e87.45.2026.09.19.23.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 23:46:48 -0700 (PDT)
Date: Sun, 20 Sep 2026 08:46:44 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Konstantin Sinyuk <ksinyuk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Francois Dugast <francois.dugast@intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Ilia Levi <ilia.levi@intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, jhs@mojatatu.com, jgg@nvidia.com
Subject: Re: [RFC PATCH 0/12] drm/fabric: vendor-neutral topology
 infrastructure for scale-up accelerator interconnects
Message-ID: <aq-AwReIVop1qv82@FV6GYCPJ69>
References: <cover.1787552412.git.ksinyuk@kernel.org>
 <apAsfOowcG0cTvT8@FV6GYCPJ69>
 <fabric-jiri-reply.1788176464.ksinyuk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fabric-jiri-reply.1788176464.ksinyuk@kernel.org>

Mon, Aug 31, 2026 at 01:45:15PM +0200, ksinyuk@kernel.org wrote:
>On Thu, Aug 27, 2026 at 02:35:16PM +0200, Jiri Pirko wrote:
>> Using generic netlink instead of sysfs for this makes a lot of sense,
>> but it may be a bit odd to use it outside the networking area.
>> I've been struggling with the same in another non-networking use-case
>> as well.
>
>Agreed, and the series shows the friction. The namespace handling is
>nominal, and CAP_NET_ADMIN as the mutation gate is another borrowed
>part of the model. I went into that in more detail in the reply to
>Jason.
>
>> - One character device per registered instance, not one global family.
>>   Access control is the file: udev rules, ACLs, an fd passed into
>>   a container.
>
>The fd-based access and event model addresses real problems with one
>global family and one multicast group.
>
>The main question is what the CTLV instance would represent. A fabric
>can span multiple devices and has its own lifetime. An endpoint can also
>be detached from a fabric with fabric-id 0 and continue to exist. A
>character device per accelerator would not provide the same global view
>as the current family.

CTVL is supposed to be just "transport". So however you use it is up to
you.


>
>Can a CTLV instance represent a multi-device fabric or the global
>fabric registry rather than one physical device?

Yes, whoever creates the ctlv instance is in charge of the lifecycle.


>
>> Would this make sense to use for you?
>
>In principle, yes. I cannot base this series on an out-of-tree pre-RFC,
>but the fabric, endpoint, port and peer model is separate from the
>current serialization.
>
>Changing transports would be more than regeneration, so I will read the
>draft before saying more.
>
>Thanks,
>Konstantin
