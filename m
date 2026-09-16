Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2790A4F0557
	for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 15:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573890; cv=pass; b=aEZsJxhqRIbLhJLmAxvLRl62sjruyKqkEZguSb/Q84LrkXYl+qbw6e37mXeD1TWwmnsaAHYGmBF/9VCJd0znzioQ/BbjETTPvLA/QmsFQTLlBgp0gaK2bIIE6W+DmGJqfAN6qXVzJzS35ZKvKK7I7itinduTi9HCClMcg/JhUis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573890; c=relaxed/simple;
	bh=bo+nR5vgnm+LSKdCiwZsyqB138gI9BLV55OIiNb16sk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OeKKqw9QhRLtCIFD6dvT1AUhpa1v+cajUOFzoNtkc9XLxPcUDcGzumJLv0dBfT9YnM+GnEBogIhN8N4k8gQyUOSpEMleAR7PKMsGZkFz1hru8Z5RdIWeAEvLul5lpxr/b58M4IEZwtR8O+nmQdMt8POvOY5FBOtvqq6KdyeigIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGLcz3J6; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGLcz3J6"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a0299c787so83258685a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 08:51:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789573887; cv=none;
        d=google.com; s=arc-20260327;
        b=BD9t2+i4rjOk3VRX3JJyPFeDNCs6BaGgpLRSgcDhZE+fFifAqzGRUSMKaDm2luBTfa
         TCojmgP061fVFEEyrBCJKASd6yFUOSErYJVUkpe53ol0MW35JG/W5nPKw0pmmvgd8hKu
         8dUdvgHXLWDgumxzsPurFZcM3lEuUfHzXzh+cFLQB2UVGeP5bgTdKwfRN54XjzMFVBKV
         SOgvwI8LfQncpgUT5qCiiEqadeAo85TJ8H6SuJ9Yf0+E2BcNdkbu05w1ZHtRwbdcakqR
         5O92XdidAraiSSZ5KMcGb7b5Asbdq55hVaTh9U6/osYvSrUEibT7unDXo12+jKBYHV+P
         ebMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1DZZDmRFFus61Ri0IMvmk4ynsdfBpq9f2UmqLYuX2d8=;
        fh=mDMIptPXxlCQ3b9+1h6ymau/Keb1Oo3fVwfRH1iqDnU=;
        b=Lho4hFOLOrV/MGxDFrvRtdfN5dUw51xZncQTRwzNDmwdXsf+/1TIb4edYrvu/kM9pH
         5qPxRifg2swoqk+9otKLaDpKOcqJXIpTbwKJJiMMAy5WEtvaGXVzvlA8e87WaJyaIYgi
         ri3WrqHFtHi3Bt+fQXk7ol6NwWgkjwltBLvzTjpskyFKF7wv4oTk6CYKCsVeNHYpb9qM
         QEUXncJaae7cHQg3FtxkolIpsUH3A6DLiSzxj0XLsEjuVAK1nFBc5rD3jExBQ/iG+gxT
         X4zJwkKrhkjdaFgJEDfnZLhI9VvtdIvBLPmVA8MrzqYgBDvmmi3I6PZNhBXHGzqLwADn
         SHXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789573887; x=1790178687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1DZZDmRFFus61Ri0IMvmk4ynsdfBpq9f2UmqLYuX2d8=;
        b=AGLcz3J6D8cp2rGznRsPFyPcIvINU1v/yg7T48xqnGt5dkha28eLx3ZfmOg1Su4v+i
         /gU/fpKa6rhN0owZ4/z7QDHBl+dedwCtQ8/XevU3H9AHT8xYD526w8nZWwY+2u6tgSn+
         ECGKKVv8XmSgeHCWNtcxogjK0+ftF4vWAK5bmZ16DQfFDw4LBTQwNd1OauDstAgUzGwe
         /ii8ms4kdiMyTe5T94twxodV7yW7QFT+ihV66946r04t8j6+vO06ssdSlbh0i1CBBHrm
         BL54/wxrNbgksxPZNnheUgK6K1QcnXXGIMDgDvva+4M0BWNy/4lnjgNU9xDcGxEuDm2a
         VDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573887; x=1790178687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1DZZDmRFFus61Ri0IMvmk4ynsdfBpq9f2UmqLYuX2d8=;
        b=lg0WNoINioAkLGtKyAnXU6+s1+edy1dzbeokWqhn9rvnHCCnDlMh0cdVUDlvjG9c42
         0/ltUAH67kreacCmHYOnLkj5y2KC/GAU2cYBgZ/IXoeZLRvQp/77awdfTc5AUDG3feCX
         HWRoEq9n0sMVSsl0kycVC4Mk/EGZ5EmvHWPM/m+OhfWL+Gn24i5MT4uIqRf9/OB1y+Y6
         kgYb5qqOIPiv1yR2trtzL2HtSCSEpGPbEfAbK5ObHWL/QhpD/Pq8szic5+TlLts9Y1GF
         Xf+tIeJMQAHps2bll0CVBLymu1mC0dXlL1m6HQ58GdYHUeYg/wZvw9/DIOX/8Jr4Tqhv
         jNIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSiZugD/lo0gvWnN5tVJCsdq8ByXFMy5gyTFgpZTFjrPwhuIsD2nMixtK2Zi9soC9y+GV3uvef0lQR5VcQn20=@vger.kernel.org
X-Gm-Message-State: AFuF++nMxKEn4thjmNHLchFdc3Z1xNG9pMDf7urG29jXfzfJiq8zb231
	0GKbDPvyb6khPod1ns9InMMBJ6ydIXJKJ/KRoWzGrdBfq/df0G9iKYwdCJcK7hHie2//dBwnTSf
	s4v04VHlLOCVZID6pEXr4dRmBBJbhBSZgYA==
X-Gm-Gg: AYBFou19dg/aaj9po5f4gB6GVDnlBjDwCYIVTygRBa66wcUlsSNpWXdnnSuXDrHYgpz
	UHNsnXl2U0y34ZNDSVqdrhM8RI6UFhtWxWBLHBlvptHciUFGLFxJv5Zv2OwCJvgkEFKYEhgF891
	4gBbgBa5y3WN0wg6ewFdMbhOTUwIO83YSJz0dlPZa3y5GX66RdTK7s+B/FbRLFat3VwafFRfieb
	xeoeXikzQBbbUSXgW+XqqvMjUlzD9ziV2V2VqNLBVqp6h0Wa6QQqhXOmT6shAhaSkjX72p4oBlX
	pqiCZ6GB8Fx29zgG13CAk6peFXtSzN1+w9UPwutdBSdKNPhZ6kjISRUeB3I5WE2cagsiyZ5XyOk
	uqtdKW2KRDf74+uX0lZnE8SPTQUGWPDWeV6LYiRSF9DxXJA==
X-Received: by 2002:a05:620a:2b41:b0:93a:463:1296 with SMTP id
 af79cd13be357-93bb77012a6mr512342585a.18.1789573887002; Wed, 16 Sep 2026
 08:51:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914155301.14499-1-tharitt97@gmail.com> <20260914161000.E3CD21F000FF@smtp.kernel.org>
In-Reply-To: <20260914161000.E3CD21F000FF@smtp.kernel.org>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Wed, 16 Sep 2026 22:51:14 +0700
X-Gm-Features: AcwNN1XHwQyBqLjDeQ7jaI6DM6CbzWrYOn3V2n8CNvXZZDMWJ0_m1PdaYmObsWE
Message-ID: <CACak8wMDhXTXkS6PAMCY1_SbvGK_v6YQBCZxBLJZY382JuKbiw@mail.gmail.com>
Subject: Re: [PATCH] KVM: selftests: Test partial KVM_CLEAR_DIRTY_LOG requests
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > +/* Use the 2nd 64-page range to exercise a non-zero offset. */
> > +#define TEST_CLEAR_LOG_FIRST_PAGE    64
> > +#define TEST_CLEAR_LOG_NUM_PAGES     64
> > +#define TEST_CLEAR_LOG_BIT           1
> > +#define TEST_CLEAR_LOG_PAGE          (TEST_CLEAR_LOG_FIRST_PAGE + \
> > +                                      TEST_CLEAR_LOG_BIT)
> > +static void guest_code_clear_log(void)
> > +{
> > +     u64 addr =3D guest_test_virt_mem + TEST_CLEAR_LOG_PAGE * host_pag=
e_size;
> > +
> > +     while (true) {
> > +             vcpu_arch_put_guest(*(u64 *)addr, 1);
>
> [Severity: Medium]
> Will this result in an out-of-bounds guest memory access on architectures=
 where
> the host page size is larger than the guest page size?

Agreed.
The allocation is sized in guest pages, but the clear request and
guest write offset are expressed in host pages.
I'll fix this in v2 by starting with 3*64=3D192 host pages and
converting that count to guest pages before applying the allocation
adjustment.

> > +     kvm_vm_get_dirty_log(vm, TEST_MEM_SLOT_INDEX, bmap);
> > +     for (page =3D 0; page < host_num_pages; page++)
> > +             TEST_ASSERT(test_bit_le(page, bmap),
> > +                         "Page %lu should be dirty after INITIALLY_SET=
", page);
>
> [Severity: Medium]
> Does this assertion assume that KVM_DIRTY_LOG_INITIALLY_SET is always sup=
ported
> if KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 is present?
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914155301.14=
499-1-tharitt97@gmail.com?part=3D1

Agreed.
I'll check for the KVM_DIRTY_LOG_INITIALLY_SET at the start of the
test, and skip the test if it is unavailable.
