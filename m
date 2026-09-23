Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0E547F2E7
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 22:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790203375; cv=none; b=miepHgob+vuBwJtFmavnS0FZZ34tZZ/XVDP2Gy4mpRs7+xwBey+EmH/dFbFxeLQ+9EuIJl07T7Er3ZE8HQJSmUUT8gxBdq1EE9pNupDGDuRHSUBNeCFAWtY239V5DkUbXeC89PWCyP/blggCeo0QGhMTG7yLktpKrcixOtrqNyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790203375; c=relaxed/simple;
	bh=XC0GtZzu0BD86oQ6ghzNMhSkH0mMeg+u7BsmzLp0cIw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RCRkKYSxa7obrBNOTeU0qOrgUToameLOMW2SztlA2YD7CvG5SmtinKprW0XoFSkcbsCj85NaNd/1MKAsnLkTO+XjtghUKx7zJvHjb7rYgeXm4ZBe2ynidehGX2P7zCXCeG5S0tgidliI1a+N/eYWAx8BVPiQafvoLFTNxFjaANM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Efy9i6Tq; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Efy9i6Tq"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso1128984a91.2
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 15:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790203372; x=1790808172; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c4ROB5gmPay6sdQJPjpG61DXTR2zRREmvWIvdqy7Ui4=;
        b=Efy9i6TqcDJ8YqaJzlDjuCyPwIaLyKS2O9ovCaahkcOfUfw6fBjKXjGsZJxgmIYvfL
         +ry2BkIWgBmHvvLFso3ZATjr5Ub2nz4RniCbWEwvHx7gtSvqfz0RQqoaSLyHHKr+7cAg
         fCPynqUX7Bb9fgSAVlw6iIJs08XGw2zX4LQGjdLwkYCaH1slKctwv43/dxQJ5fwr5qlK
         3wguolRgh/3ajD/pELswggZC07wCJZ7S8jOUJ/klp/L0Z8QNORQ5nW1tC+43G/7752xM
         VvPWetDskQ2Td3ZeLBr3OoSizfwykLv7LPxq3KRZhYRIyiLC+bPUnb5JoFg/+gxFbPSe
         2rPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790203372; x=1790808172;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c4ROB5gmPay6sdQJPjpG61DXTR2zRREmvWIvdqy7Ui4=;
        b=xnYLrBrOJfUzmRUcW3TsKk/o43TZTnFyX62xWmvXbxNYeFpGyPKqjcbfvNvpqhynoQ
         wqUF/xlNdN/hqx5NLZTR5pUNH3gc7TH7Nnw02X2IJPzjTXSBzb1UNUCOWvHybGCvi+ru
         C77dU6rad5nAN5N1Y01WiBnQcjJbQ0Rw1gtRPVHavq9H+HS8XrhSzTdqCMKk0Vx/5uZR
         kLm2ymAYszeTn1HDaryy/NxqOzBuFnuTVcU1pOdEMKNbE85qRifNIQrqQoemS/rFsXEE
         fKysBRtpYH7iCKXFdBmQWV6gFaZbR5rIUvYYSmZw9IBmopO5C4RLAH8m+J+Z2pc1T0Cy
         zbng==
X-Forwarded-Encrypted: i=1; AKwUvByqktKVbiUbngwtsAK0leTGBJj95QoXi1Uj+dTyLgGm7trSz14YfnZ+oXU0xLsywvYV6iPdp0LtYh7xPV7/yHw=@vger.kernel.org
X-Gm-Message-State: AFuF++l9ZmOHC5uH41SPow06j67xWj6n3Obaf8XYeDBNF7JYHQLrd5T4
	sL1qleBwsZVilwUK/Qzi8DfyITxRmc6YazKpXHYgYpD1iMW8mIFyZGt1SzFylA2w0bnCOg+hU4s
	H10Haxg==
X-Received: from pjbbh7.prod.google.com ([2002:a17:90b:487:b0:3a0:8315:fa7b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3f87:b0:398:a486:81ec
 with SMTP id 98e67ed59e1d1-3a0985b8f01mr435176a91.11.1790203372353; Wed, 23
 Sep 2026 15:42:52 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:42:51 -0700
In-Reply-To: <6-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <0-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com> <6-v7-c6d30e8ce1e4+3dfa6-mlx5st_jgg@nvidia.com>
Message-ID: <arRV6y-d1rkRV2Fa@google.com>
Subject: Re: [PATCH v7 06/10] vfio: selftests: Allow drivers to specify
 required region size
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Leon Romanovsky <leon@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-rdma@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Mark Bloch <mbloch@nvidia.com>, 
	netdev@vger.kernel.org, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Mon, Sep 21, 2026, Jason Gunthorpe wrote:
> Add a region_size field to struct vfio_pci_driver_ops so drivers can
> declare how much DMA-mapped region they need. The mlx5 driver will need
> ~18MB for firmware pages. Existing drivers pass in the sizeof their state
> struct. Since drivers all use only their declared state we can use the
> value directly and remove the SZ_2M hard coding.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---

The KVM test still runs, and in David I trust:

Acked-by: Sean Christopherson <seanjc@google.com>
