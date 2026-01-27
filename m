Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDE536E469
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 19:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542490; cv=none; b=EYh5D6ArnjH+0smngvNsYLmrdyTYvLgNmp4z0hxdvsBB2MKKG4q9fBKDPsY5+ZplL86segDFVMvcArnAgnsT72g819LMFmUfwpG7fr7BQTy9EcvitCVNOiZAMCCzMlQ6/y3ZKm6XAdnruff6GkTUcNfVOZYT0O1M7cGR3IZGtEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542490; c=relaxed/simple;
	bh=05TbWWxv3tntbUxViB7tGA8U0cvXI8ITITBDahJ1Ac0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXL33XsZ0mNbUGrrgZt1iliVYXw+HvWQ3zL83dwqDj9tBCdzkZayGp27hiNYoHG+Juj+Ih2i/cueFKe/I6+xMVARec/c33Qk3qox5aElhGfKpiuxlZk7L9042C6hIqU/DXCxc1O07I3jCj1oQ4E8HA8OHdBcTH6e7qYyQFu6tjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSFeXMHE; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSFeXMHE"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4359a302794so3835937f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 11:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769542487; x=1770147287; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lK5TGsJWU7nuB/Efm0pXlDktNbx5xUrIMoFBpRFKJCM=;
        b=iSFeXMHEhGdvaET7bjhMQPIYrA2Gz9AS+OcV7YK/L0wPBPEATr8UzPbzukxz+hLiUk
         xGn9LAegguUa29M+kOksXNIAc/6yHagr4SEFAcJqbJWNFXLttPKwrrSXbMbiCih6ZWBf
         TASsFs5cjvzb+GqHndjnE2wU+/3C7q8YWapHSM6nhhmBpN55Fm2ZeVG+zz3ZT10TAF5d
         amKuPWMJScIGZcsUN39WOTsQhgYls8gwWHxVzP9C+zfXmooDYkH6Lw1P2F79HRdmcVPj
         sXJ/HiWxeIshGvo0U8GcKgDzFprU95EFTFv3NURkWcKVZh8HOLy+xmpJUx7bTPuzbkB6
         wksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769542487; x=1770147287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lK5TGsJWU7nuB/Efm0pXlDktNbx5xUrIMoFBpRFKJCM=;
        b=VjYKIm1nFCNrQRTKqK1Dlr3LAjDG/OLzhLMa80INqGbKo5Of+xB4QDEo7QBIVKEzLZ
         aTWASwMANMQaroAetHQQNW3iiM4BY0gparFUAOW2qp4hCzMq9cduQ6aosqROjhd4+WqL
         H0ENmOCPPPqks6w4jaoZw8jwvP2T+5JnUfzhcL8pFA81lHh53zheu1WnJGOa2X1jBpGl
         XGsOZ50DscQmNz4gtvHYepbVGE5uYmA2zXKhC5mHpku/12CeTYLrGKXl1Q09COR1QRir
         A6bGFwZVk7kDcvmM07NLhlIXNTROUgq0k6tu93eTOzczwN8OZkvRAoXv8LnkIjTX/YRj
         H0JQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9DijzQH9pqWR+ZST94VMP4FccDi401+otmLeVhHbw5VBHEJuB9zp96/mxgsEjdklz6kiXs3OWQE+wsB4I1Cw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHe546zDQ7ub78RbF8Jq0oW3MwV6LZ1ceQz7K0t/Eo3y6TMi4J
	P1uqpJde1TzqYBwxhqcxZzHG6X7Ek0wcyJYR3MnRKLy6IMcl21v7Q8km
X-Gm-Gg: AZuq6aLOHMdtVBG2+VUFmQWRyULKyu1SHoEQ631JzkX/aAXmHUgsor8T95BXSqpkq1B
	xoKyFq0aFCMg97oaxdnt0O+qzjh08QkUwyij9DhjFsGfUy5eldkoJ2pjojgX11DWj1C76lO0GRu
	3z/EVMxPweHqzpHZjUFBCl+ooZX0V49dtXhtMhjlP4DoUeM5fmRk/L+P0QIB2nacRryfWooxVM9
	s2mZV/Zj3+O5/cmn51RIDKAz5Os+abjFtUS1zLdFpAQ7zEcdhtu1dv3DnN+BTxmcOWKGkfl7XFV
	eHhKGu9mEeOtZTTTu44tsfQk/Gwnr+SvsBGT3w0dzEjtrY7czTIpmESExR88sRhR6kmRLyKy0UO
	cPdUPpYvN2IcJpZbq+BwpZTavG4zK/eboesintzPPJpbWAebrlhEsLiDG4eDYzv62loFDfoGjdn
	+knxrTaA==
X-Received: by 2002:a05:6000:184a:b0:435:975a:131c with SMTP id ffacd0b85a97d-435dd0b6b23mr3917733f8f.36.1769542486975;
        Tue, 27 Jan 2026 11:34:46 -0800 (PST)
Received: from archlinux ([143.58.192.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edfe7sm990496f8f.14.2026.01.27.11.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:34:46 -0800 (PST)
Date: Tue, 27 Jan 2026 19:34:44 +0000
From: Andre Carvalho <asantostc@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: Shuah Khan <shuah@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] netconsole: selftests: Move netconsole
 selftests to separate target
Message-ID: <aXkS8b4vimfz9MvV@archlinux>
References: <20260124-netcons-selftest-target-v1-1-d3937f44c4c2@gmail.com>
 <aXdYwphLx2O-Hxis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXdYwphLx2O-Hxis@gmail.com>

On Mon, Jan 26, 2026 at 04:10:18AM -0800, Breno Leitao wrote:
> 
> I don't think you need * here. The following might be enough.
> 
> 	F:   tools/testing/selftests/drivers/net/netconsole/
> 

Ack. I wasn't sure which form was preferable as I saw both being used. Will
send a v2 addressing this.

Thanks for the review!

-- 
Andre Carvalho
