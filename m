Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795382390;
	b=c1HHXRcVJKg5Hk22q7UHKKKPobPC600Ne8eERIlNIsYvNc2ZUsumqn3vJaOy4TQXC2qt
	 5AqRaNMrkldTPXqnjmK2WngtqTwmpqnssDm3UF04BT7JfrEvsNY308Lzrg+ct5AoBKgbQ
	 n9uO0Pyu7RjQ0WuoMzvJVFFuFwjew7yV4AHaTYU99EuZWuMG9smKJrirzsrqMd1Ue7KIL
	 i5LW1VUr+3LfD+yftO4dUyKd9PG8U6RjGv2wTfPxobtuMb/ta6ZkGdUzW05qr5Xhk+wMc
	 imnmOkYr5+OOc2a2D7HLzzUOPRmAcCbg1QQ5VwFlUeacC+6sFVdZCdCGFtZDlsaYSqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795382390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jlHx3q8hlvOapQpFRbpBP1dZTmv+VTbbRyW9rgzkxFM=;
	b=tBU5hhiUBiAEjdKmmNd/DezRJjY4tMjdbfVbxGJm9yha/P8dJtsvXo7CQ49PXrxeqcqq
	 KiEXZ8HxfP8k1PEhxIHRV6aAMHsBFPkjOqyrSSUAdjtXrnxEQ7cXA1WhehpPWithbffZa
	 zK5eq8jHJUDEBFStUQJ5Vlq0yF+3c4EnJpIcZ/0sLqhxf6xI2JEowNMy6riIa8wzBpmSo
	 7m6BXP2KKSQaf5kc2QcpmJzrY0jm4BidTl21yNNQxFRswb2xCgJvtmCFULZFuhSzRL1sx
	 A+PVSRzEpEoyVSpEN0oTtfthmt6/qosfLvazGibfwgs308hmhq2IBMvaAejnZ5iD7xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q6YuWc3T;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD63606A327
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 21:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDD63606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q6YuWc3T
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f048bc09d7so61255ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 13:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795382389; x=1795987189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jlHx3q8hlvOapQpFRbpBP1dZTmv+VTbbRyW9rgzkxFM=;
        b=Q6YuWc3T3SalsZoSZ7nZACQHkeGNao4ybVKhTt0wRTBMWq/STNikHYxymoVlbxJKwt
         ObO7f6LqOfkLa0ZWQsDUJxcoIFT1R7RX+ch+NcX9HjC1fUkz2lVXWap2Fhk6d1BNQ0/q
         ou34OmAd2JjIq4liY6+XTlyVs7lAo8j7mMJNCn4UbXdO1PySd7WVB7CcG5aY5NFk6zeK
         MTPQ2mPRuN0yBX2byMj04WfBHffJTGoEmJVbEpdFlNNAdwmn3w7R5fnIWHJ14+7KZJBj
         9JP319l80gUmvzuJ9ttWm+kYAoDSsisjSAMPzJOAjU3H2qQMyoaLkA8b4AIwL0EJiVEx
         8BtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795382389; x=1795987189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jlHx3q8hlvOapQpFRbpBP1dZTmv+VTbbRyW9rgzkxFM=;
        b=xf1Q3jRtWhxg7dmUdvaX7i3fC7Cdiv/O8wB4OvFLEWquLVahoEOubyoVqX4pdZo5ku
         ThA+dgvt2++X6jv6JphkujqCOP9kaanhTxsBAFSnJuekdAqreOyLhsXTEos0j5UihsUp
         bLmSMPdu5cl7b+rEED1npn+18itFdB0wQ2V1mWHbWEHkN8u+XjMD8+9b8z6kpnKC1tPx
         YqsNFc77xa0hSzQZruiQYCkcM8VbkCB/VGQPpYHx2mg5izMA/KiNWbkRNWdKd8XnH/Be
         Dw7B5ChNvba+GWVClOWBAwcVAmYFTMUB5JWTVnAow8jr7a6scYezteMGRslZknLiRgQf
         OQDg==
X-Forwarded-Encrypted: i=1; AL+hErFCnCYADMwnPdj07J7FgmlQDEbKX4C6nPDm89KRqmHV/4XLLh/XlmNFrHwl4UO478VzjLHR6i5B2TUaxW4eRQk=@vger.kernel.org
X-Gm-Message-State: APuU4Z95qYH1VW8NTw453/MWJlS1S5BMf94dtInFiunzp66GiEfj8Ia4
	zDRC1zsv+6ltvvSaHnGk1Rlg0OzJtH8EHBZWzFvTMmqplAS7A0tIVKKj4bpx7AFnBw==
X-Gm-Gg: AZFdTZfS/uZKwRwD3RqAowtAdWrN+D6wPwiIo7gQ8j7wPc0JPpN2BNfrx8wqH32Hw1n
	OrMvAowrEgbircGbTFtmztio7sqgL0UAPsYTY5SZURYSb171VvhDjT+uZ86Fzjh8axxqGUHjz9I
	kYtX5LPCLMVZ/slqs6wmwOXF2LzbavBWkRszd5uhUnt6OpctExihNH8psTnzSosdJIHRb5g0NWY
	MG8lLJ4kVrvkKmqsgVUZuvfqo1ZiTG0DqCQYgU20ShMtzNVp+CKiXRePJReHcJbrLYQRg+dOxzJ
	0XhqFWHe9dqIeiOAWJxzTP9JHwM+rDVcJRHAolsyf516BcH/6CwdZnEFx/iOjl6lyl4ahYTkZY3
	Qfo53E2kQCCpYtzF+Rg0WAVIigiQPlP94c/kHoVW4BvVtl18U6fWyf/knYmQVKb5yAvLamnjaL4
	uTZi2n99yerTMvR2p2ZBr1eUwSJdq11FzfMp58m7IQV4KokancfwGUwVuFvbOUdrwjPiznhbpT0
	qSr6W/ohrHbe0NqZ3yQfsCptSVfLhz9i85qAza6XJiQ/E3HZ+q31Cs/1BWjLnOZ0NyrNiiDWGNe
	2tVrh0mSRSqamBsmPasa/ehLDW9YLmIj1WwbQUCME/17f6LPguZ3oX/IFfQIOFz82t2UAc+q4oc
	0iJT2OIbWbAP7J+PgosGppg==
X-Received: by 2002:a17:903:19e3:b0:2d5:db38:8010 with SMTP id d9443c01a7336-2f066708a17mr4257845ad.15.1795382388397;
        Sun, 22 Nov 2026 13:19:48 -0800 (PST)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm18461423a91.8.2026.11.22.13.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:19:47 -0800 (PST)
Date: Sun, 22 Nov 2026 21:19:42 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org, ajayachandra@nvidia.com, 
	alex@shazbot.org, amastro@fb.com, ankita@nvidia.com, apopple@nvidia.com, 
	bhelgaas@google.com, chrisl@kernel.org, christian.koenig@amd.com, corbet@lwn.net, 
	dmatlack@google.com, graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, 
	jgg@ziepe.ca, jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, rananta@google.com, 
	rdunlap@infradead.org, rientjes@google.com, rodrigo.vivi@intel.com, rppt@kernel.org, 
	saeedm@nvidia.com, schnelle@linux.ibm.com, skhan@linuxfoundation.org, 
	vivek.kasireddy@intel.com, witu@nvidia.com, yanjun.zhu@linux.dev, yi.l.liu@intel.com
Subject: Re: [PATCH v6 03/27] liveupdate: Export symbols needed by modules
Message-ID: <awNVk3q6Q6sAHn6U@google.com>
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-4-vipinsh@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261102153656.1431701-4-vipinsh@google.com>

On Mon, Nov 02, 2026 at 07:36:32AM -0800, Vipin Sharma wrote:
>Export liveupdate_register_file_handler() and
>liveupdate_unregister_file_handler(). All of these will be used by
>vfio-pci in a subsequent commit, which can be built as a module.
>
>Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
>Reviewed-by: Pranjal Shrivastava <praan@google.com>
>Signed-off-by: David Matlack <dmatlack@google.com>
>Signed-off-by: Vipin Sharma <vipinsh@google.com>
>---
> kernel/liveupdate/luo_file.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
>index dbae0715220b..6aaa9a531428 100644
>--- a/kernel/liveupdate/luo_file.c
>+++ b/kernel/liveupdate/luo_file.c
>@@ -916,6 +916,7 @@ int liveupdate_register_file_handler(struct liveupdate_file_handler *fh)
> 	up_write(&luo_register_rwlock);
> 	return err;
> }
>+EXPORT_SYMBOL_GPL(liveupdate_register_file_handler);
>
> /**
>  * liveupdate_unregister_file_handler - Unregister a liveupdate file handler
>@@ -933,6 +934,7 @@ void liveupdate_unregister_file_handler(struct liveupdate_file_handler *fh)
> 	luo_flb_unregister_all(fh);
> 	list_del(&ACCESS_PRIVATE(fh, list));
> }
>+EXPORT_SYMBOL_GPL(liveupdate_unregister_file_handler);
>
> /**
>  * liveupdate_get_token_outgoing - Get the token for a preserved file.
>-- 
>2.56.0.317.g454f8302e1-goog
>

Can you please send this separately, it can probably go in without rest
of the vfio changes? This is required by iommufd and guest_memfd also I
think.

Thanks,
Sami
