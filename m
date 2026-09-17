Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E014E9C24
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 20:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675899; cv=none; b=MGJxTchOp6D6Z8+yOkCgaGtd/kTGyMk9X+LAD2vDY/B7O0PcBVSZm3Fz+plqNwH49L06S3uCQv1QjxH6y75zymltmEewFlhO0q7IETRPkW+909EdwYTfwbyhN/wOk5YlC6/8pf9Yg1iatTxX/4qhqs46LgvSaiuLeNG+jaUk5sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675899; c=relaxed/simple;
	bh=Pld+KJDf/y0brTSHAZfyNj7LwB26z/vcvvMjg82D16g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=MFLnYUiFWXG38k27EEyF6VwQ+77fkUbb1VubiZk+8KktqO+Upu5vm8DTljcSnlBIcGtnTCtfPMaYtep9uly0V2Elo6X9K7Io2S+MUn+rOsjtZQIrg14jczBD+6Rhqio1Vowx5FMQlnnHB50Qgzku7k25GUU0zUQyPV2uPHjIwLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEG1HNV1; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEG1HNV1"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469a3490bso68614b3a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 13:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789675884; x=1790280684; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pld+KJDf/y0brTSHAZfyNj7LwB26z/vcvvMjg82D16g=;
        b=jEG1HNV1nB356xIIlFyTqdaGPUUh9EjM/3PMbUs+3AGI4ehoP6+sJVH1PhlKRJdi74
         49iLVhT9tC9NObKt7CYqbEQamlyNxL8drgZcjYZ9wTLMuI4t48nW91cDfveXf0Si7vCw
         54dSWTEmPbs9HqyhwNdcIeab67Tty0F+QyFDkFaySQpj76fSQNllBZtFFvlb1jacOCR2
         FmpL9hmFxdFK867OkjHeAXKI83GK8UB4CV1xuosFIQTGXxVsJUsjkAlXWhAILWlyh4HL
         lpFK8QRjRmw0sPKGRoO7Aa3cih6io/pYDi7ISzk1TEp/o6Wckao1szsQ3Um6dWzlqWkz
         9vEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789675884; x=1790280684;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pld+KJDf/y0brTSHAZfyNj7LwB26z/vcvvMjg82D16g=;
        b=svvEFYC6uiDmwB6bTmuK6keJ/mZxiz/9uahHwe7Vj68aCIVbqI3Zsg1zY6+QpEprtH
         GbpSkKLK9EXD/8ykjp5cLovTA8Tn7AWk+sqYqy87hj5Qr2ebn627THlgvItG32jRMxFP
         2gVcCzc1O5JUgSP1Gwe6shRQ14IH5KOVdN8FW8uF5vhh0bHjBB4l0NODU8uIgOrIqAmf
         +vIsAfIsCwnkHbP/xeh4mGOu9936TYDyAVdBiKwcPTTkRD47a2AqiBSa7uIOwPHqARyC
         qRQYlQYSxeW6PiJFOHYioCertdEXiqQNvp/LoxWm4NKMkNo6d6ohInJJrYkf/t4fAzI4
         BuNA==
X-Forwarded-Encrypted: i=1; AKwUvBwflvLiBwW8Zi0XDrX3Tci+Ce1XQdoAdeJug4tegoUTg2dJeXecOHio6Ryi1bqLmJE6LP5ZRgU3EgMS6jAI18c=@vger.kernel.org
X-Gm-Message-State: AFuF++nt6rXqsBevTu5Nw/GIjBYP2X6SOWtFnPlTJok+rbmpFflV7eAp
	UaUP9e4bUC/BDm0Ttr4p8/k3Drj8MtnW+HEDVs1WO4lNJ0ecmtZBQLU/
X-Gm-Gg: AYBFou1wrHEvnAf2BwJtjIOJAiSIbPI9vjMGCki+PtafomCduvhSGR6f+u+2uHQ0q5J
	3Z6qkbJZl2uuGXBwAA5aiTXcDTR3I3wBxU+jSw2hczpu6Gs9gaelLlv/GmPs3rq4+vNn+0/lbA6
	Uu38T/kGXSZMIYEg69EVk0zTKa/HZAMtJOtxDZjBdeQnXWniGnpycLCX/f/aTOmyM8WTg8Cdhn5
	sk1KX6+uhU7WU9Pa9zHCAx0XKmNn9nDph/YNjo+f9xpZGPkgTT9askbC7OWGJrAQIs2788ZId5B
	N5CdChCVHuymNlAKek0d3iE/J3NZle2VGiUfMUcn0YLpUppjmWnqZohbSgpQxk0ohq6vyaDVhdA
	3SUWnJdFQeI8wVQpWa2UXRseOv2MQH7Cf8zzOw4inllk8TamQGfp17R8mKEeYpq8uLedRneq+YT
	btGgsvxauwDEhzSawS3roRCFQZEvSea/Gmu+8XpPNGVaE88Adn35+Cr++GGVf+WVnRg+28ULU59
	CPIpSbFQLNVrRNthQO4hh7KfOc=
X-Received: by 2002:a05:6a20:cfa2:b0:3dd:5831:ef58 with SMTP id adf61e73a8af0-3dd8c456190mr204908637.15.1789675883461;
        Thu, 17 Sep 2026 13:11:23 -0700 (PDT)
Received: from localhost ([13.93.150.60])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d13ee7sm16211287c88.8.2026.09.17.13.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 13:11:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 20:11:18 +0000
Message-Id: <DLHV5GF21AY4.3GAK241ZI2UR8@gmail.com>
Cc: "David Ahern" <dsahern@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "Randy Dunlap" <rdunlap@infradead.org>,
 <netdev@vger.kernel.org>, "Arun Ajith S" <aajith@arista.com>, "Roopa
 Prabhu" <roopa@nvidia.com>, "Jaehee Park" <jhpark1013@gmail.com>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Shuah
 Khan" <shuah@kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "Alexander Aring" <alex.aring@gmail.com>, <linux-wpan@vger.kernel.org>,
 <linux-bluetooth@vger.kernel.org>
Subject: Re: [PATCH net-next v2 1/2] ipv6: update NUD_FAILED neighbors from
 NA messages
From: "Lawrence Lee" <lfqlee314@gmail.com>
To: "Ido Schimmel" <idosch@nvidia.com>
X-Mailer: aerc 0.17.0
References: <cover.1789448374.git.lfqlee314@gmail.com>
 <6596966f734f3d416bfa83722f7a595149bcc3f8.1789448374.git.lfqlee314@gmail.com> <20260916120202.GA935660@shredder> <DLGXDIB879EO.IDZNAIRY0VFJ@gmail.com> <20260917143750.GA1332286@shredder>
In-Reply-To: <20260917143750.GA1332286@shredder>

On Thu Sep 17, 2026 at 2:37 PM UTC, Ido Schimmel wrote:
> On Wed, Sep 16, 2026 at 05:43:11PM +0000, Lawrence Lee wrote:
> > I added the lowpan changes after my local Sashiko review run=20
> > identified an issue where a FAILED neighbor can retain an outdated=20
> > private short address if it's moved to STALE by a non-override NA.=20
> > Happy to drop all lowpan-related changes or update comments/commit=20
> > message to reflect the changes, please let me know your preference.
>
> And if the entry is INCOMPLETE and we get a non-override NA?
> lowpan_ndisc_update() will ignore it. It's a pre-existing issue and
> there is a TODO comment about this:
>
> "/* react on overrides only. TODO check if this is really right. */"
>
> You can mention that it's a pre-existing issue under the '---'. That
> way, hopefully, Sashiko will not flag it and it won't clutter the git
> log.
>
> > This was added in response to another Sashiko local review finding. =20
> > Let's say we have some FAILED neighbor T with NTF_ROUTER set. If we=20
> > get an NA from source address S with target address T and with the=20
> > Router bit clear, existing kernel code will cleanup routes with=20
> > gateway S, but IMO we should clean routes with gateway T instead=20
> > since that is the neighbor which was updated by the NA. I can either=20
> > update comments/commit message to reflect this or remove the change=20
> > entirely, please let me know your preference.
>
> And if the neighbour was in a different state than FAILED? It seems like
> another pre-existing issue. I guess that in practice, most of the time,
> the source address of the NA is also the target address in the payload.
> You can mention this under the '---'.

I will remove both of these changes, add comments below the '---' as=20
suggested, and resubmit.
