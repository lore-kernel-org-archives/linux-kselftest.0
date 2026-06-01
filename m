Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC4A3B4EA3
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 14:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780325058; cv=none; b=bTSUT1pJwkNoOQYUCMbibP//YDp674YiAY0pM0cvIxCjINIgPo8oA+TsfF5WbX/W5vKJTlhfeOgayigz8hOJZuet0ZIFzvqdAUI8pjFBQi2Bj5sy9b+QRl7trxW9n0zELuovkHCftDoKcRlM/FsDEYXMncSDfMDeI9sT4XO+EUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780325058; c=relaxed/simple;
	bh=0/6PPPczUPstqdeXFmlTfi2ZpOlCRrU6ph2Il3cBxlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xw+ZsyGjhuBKS07D/lKLMj61+ajLRfZowU2j2kN4WhpVLkagxkm8IXXxw7aWa/v2NZoc43KxR2J3LKgy0ma6OrDKKLQDHVXNdNuIjuj7FaNxISauvUV8Kf+YmnY5CNw2t9ka1cED/TWVh7rKkzhjLKskzfaHdazZrMNWWp+04hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=I7VK568K; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="I7VK568K"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7e38f2f3800so14874957b3.0
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 07:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780325055; x=1780929855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GHCECJLKZVXmKAb51dyXN6SjQcWAQtdhT5+Tc3oFsbc=;
        b=I7VK568KcEwbosq/EbTGcWrIWERYiWOyjDcOq3m3698R1hXs+AhVn11WSLYA7hAZqU
         5xCYlKtdJnsx2pxxV6MyphNf449+AoQfu5UTEp4axbZ7n35baxn3uA10sM5sNGkhi/uW
         SfNSqfMCRuiaYIWdla//HzfOK0w2STY9106SXjsLmds6NdpTHabCk//lVzT9soZ0Lset
         YxUpeIQ94rHYEJGRqE/SgRbtUhrqKqWgZCg8t5D3LHvsVZACfKtyOOWxW+tf5/BpUMIX
         xx60JO0o3ZgA/Yfyi9Ge/eikZOTFow9f8aFOhFrhAY7pa0ll6E5J6HIWIMPUCvkt9c0f
         uh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780325055; x=1780929855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHCECJLKZVXmKAb51dyXN6SjQcWAQtdhT5+Tc3oFsbc=;
        b=lqHwj5zsrnZ835l1YtdGSaDOGX/CbfvyyYzuief+hfSB4SWuL/PmwoW50kVdj/JUIs
         66y61K8kShdQAUP+B2UpncaDUi1NE1XQJoo9b1ZdHxdYE2rdioN36UHLv1MyGn+4392i
         drex44OqSzqOzJ7D3j5p4C/2gqc7y3aYV9yBdpA80/i5aFX+72DpMo8gUsuds2aZJnGd
         HXX1dmV5dWD+uSOUQL04ziC7H2RJdNgTLEKBb3BoDhn02AiqiCBQ2ir4H+wc5L4UG9Sm
         yvz+vO5AUXY7Z+flX5pBbhqyzGPC/GnDO4Ye7axVvLXWPabt8J7/9xygdgJg/PzoC22N
         KPXQ==
X-Forwarded-Encrypted: i=1; AFNElJ82P707leWMit1e66keXRzT5T7dhmAN8pjbd0yKfrjPU3MQWqeKrrkvuWbPJ78GUJJ1VURuG8uOtSSJZpKsMZo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy06yJSgj1sfkXQyCrtiUdg+Rohqv3Xnd2yeI8JAkKZpybqL6ur
	OwE4/fDloXR+SMtKG2AEdQGZAvF/x1PsdgpHFhHgv8+Ap93nKfDMcsVKjisMNv4Aeds=
X-Gm-Gg: Acq92OGfG768ePoAXvUU6lBN0N8V3qe7stw+WvY/xKeuQ19NOuBPyaxjyMTAqIU/JMD
	+RphnpMKHbzU/SGtpwAiYJRyCpoiuZ3mbQb2XVawCYTivbOysgwTYRfm5ArgpqiqdDsqpY9InJm
	VJbjr5QkbcGwLETUZ763DyPJnSWya2u5wPSYbpB8OtEbW3dqjsfpoVLPO+kZrVoZ+1aZjsC8mUi
	j5faf2y3RONelCGvbdOyW+9Lxpb/WbKKuSHuiOlS/nbLYiYBl9z7f3RLD59i7dJyeZ3YL+6mAWz
	bKW2V7K8tKNuZ5uVJeflezJsGpWWJ2oQXbFpF34eTGHpY5xtMG12BKmKOOjJwodMtwImT/g0POF
	TkU05twoQFI6+WTlOoFFOqnLO7GvGourowljCEtlTmT4vNr9TurSJ8ddV7Da5xCkSQvtD9LxuTa
	T9i2xAGI7IUH9AftFJDWcc0QQUrUxyXOmiUD8uy/r3vnFf7ux0ghSKe29722rHpbR/LwyPXzuYo
	s7F1VwTlDiZikH0bx64B/cU+5MiS0uahuHQxLIFwGjAPGSOWvep+A==
X-Received: by 2002:a05:690c:3511:b0:7dc:e580:7f8 with SMTP id 00721157ae682-7e05d0172d6mr107595267b3.26.1780325055588;
        Mon, 01 Jun 2026 07:44:15 -0700 (PDT)
Received: from google.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7e17c9ac78asm41186257b3.43.2026.06.01.07.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:44:15 -0700 (PDT)
Date: Mon, 1 Jun 2026 10:44:14 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, akpm@linux-foundation.org, 
	linux-mm@kvack.org, skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, dmatlack@google.com, kexec@lists.infradead.org, 
	skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v4 09/13] liveupdate: Remove limit on the number of
 sessions
Message-ID: <ah2ardT1UjymdMqd@google.com>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
 <20260530221938.115978-10-pasha.tatashin@soleen.com>
 <2vxzfr36fjcj.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxzfr36fjcj.fsf@kernel.org>

On 06-01 16:03, Pratyush Yadav wrote:
> On Sat, May 30 2026, Pasha Tatashin wrote:
> 
> > Currently, the number of LUO sessions is limited by a fixed number of
> > pre-allocated pages for serialization (16 pages, allowing for ~819
> > sessions).
> >
> > This limitation is problematic if LUO is used to support things such as
> > systemd file descriptor store, and would be used not just as VM memory
> > but to save other states on the machine.
> >
> > Remove this limit by transitioning to a linked-block approach for
> > session metadata serialization. Instead of a single contiguous block,
> > session metadata is now stored in a chain of 16-page blocks. Each block
> > starts with a header containing the physical address of the next block
> > and the number of session entries in the current block.
> >
> > Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> [...]
> > @@ -63,13 +58,15 @@
> >  #define _LINUX_KHO_ABI_LUO_H
> >  
> >  #include <linux/align.h>
> > +#include <linux/kho/abi/block.h>
> >  #include <uapi/linux/liveupdate.h>
> >  
> >  /*
> >   * The LUO state is registered under this KHO entry name.
> >   */
> >  #define LUO_KHO_ENTRY_NAME	"LUO"
> > -#define LUO_ABI_COMPATIBLE	"luo-v3"
> > +#define LUO_COMPAT_BASE		"luo-v3"
> > +#define LUO_ABI_COMPATIBLE	LUO_COMPAT_BASE "-" KHO_BLOCK_ABI_COMPATIBLE
> 
> That's clever :-)
> 
> [...]
> >  int luo_session_serialize(void)
> >  {
> >  	struct luo_session_header *sh = &luo_session_global.outgoing;
> >  	struct luo_session *session;
> > -	int i = 0;
> > +	struct kho_block_it it;
> >  	int err;
> >  
> >  	down_write(&luo_session_serialize_rwsem);
> >  	down_write(&sh->rwsem);
> >  	*sh->sessions_pa = 0;
> >  
> > +	kho_block_it_init(&it, &sh->block_set);
> > +
> >  	list_for_each_entry(session, &sh->list, list) {
> > -		err = luo_session_freeze_one(session, &sh->ser[i]);
> > -		if (err)
> > +		struct luo_session_ser *ser = kho_block_it_next(&it);
> > +
> > +		if (!ser) {
> > +			err = -ENOSPC;
> >  			goto err_undo;
> > +		}
> >  
> > -		strscpy(sh->ser[i].name, session->name,
> > -			sizeof(sh->ser[i].name));
> > -		i++;
> > -	}
> > +		err = luo_session_freeze_one(session, ser);
> > +		if (err) {
> > +			kho_block_it_prev(&it);
> > +			goto err_undo;
> > +		}
> >  
> > -	if (sh->header_ser && sh->count > 0) {
> > -		sh->header_ser->count = sh->count;
> > -		*sh->sessions_pa = virt_to_phys(sh->header_ser);
> > +		strscpy(ser->name, session->name, sizeof(ser->name));
> >  	}
> > +
> > +	kho_block_it_finalize(&it);
> > +
> > +	if (sh->sessions_pa && sh->count > 0)
> 
> Nit: Why check for sh->sessions_pa? It can never be NULL.

Good point, I will remove it.

> 
> Other than this, 
> 
> Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
> 
> > +		*sh->sessions_pa = sh->block_set.head_pa;
> >  	up_write(&sh->rwsem);
> >  
> >  	return 0;
> >  
> >  err_undo:
> >  	list_for_each_entry_continue_reverse(session, &sh->list, list) {
> > -		i--;
> > -		luo_session_unfreeze_one(session, &sh->ser[i]);
> > -		memset(sh->ser[i].name, 0, sizeof(sh->ser[i].name));
> > +		struct luo_session_ser *ser = kho_block_it_prev(&it);
> > +
> > +		luo_session_unfreeze_one(session, ser);
> > +		memset(ser->name, 0, sizeof(ser->name));
> >  	}
> >  	up_write(&sh->rwsem);
> >  	up_write(&luo_session_serialize_rwsem);
> 
> -- 
> Regards,
> Pratyush Yadav
