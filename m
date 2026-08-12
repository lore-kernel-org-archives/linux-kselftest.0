Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3751B384CE5
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 16:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550777; cv=pass; b=SGXCqqFu5SUfJRMnbHZP4lYZPmOfnhmbAic0J017V4muXbKPWyJrr4veNjOoNdCwVIbn9X9kRVnKOsI0F3mvEBT47ifhL4KTV24LtvLSa2MiOOimwG5jbG7AYVr4h4B5W2kIE+2R6Os+fVxM4xSKvBYzVajo03f5vxJOvoAMZDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550777; c=relaxed/simple;
	bh=J9mnqO6eJ4ZveGNY3D4ObFWr3/57QctvngM8TX1zOA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jm5j0Iv4wSKw1AFlWA/yl3m9Zpc/xqjm8YpjQPtR5yrj+fGFxUW5bntFymnzn/PU+zwEVicfuYrGlzyofwKVzYnEta98HdZM1xQrsLN+l35dIgAFPOZi6xv2wP5O0hGkuEVCGpX31BxV35zY8kWqB85D2UmHnhsAKgx1zzW5Ozw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bMrCuosY; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bMrCuosY"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4994d67d260so54935e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 09:06:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786550774; cv=none;
        d=google.com; s=arc-20260327;
        b=G+XOKSi/2nJ++DKARp1T6GLGnpD0TfODJekwRidQIzuCAkiYU4t7x4kSGvbyeuFKI6
         6gIPoi2G0M6iSa2KUj2N+gqt/+9RwFDAP8x5WXd30/4DUPWdoW/YkbLpfVKH/dNdwx75
         0INrD+1bKQpyrGp2MXezs8L9UNDotLeBWuWiZpr1OHv4VLkQSdNnTlBHWV1Ndk0fyxcZ
         qOSHpPlE4ZYRZfEhaG2E2VsDfX77u6F3Y6IqgZ3/l1vQsMFJ7n4Dqv/wb+nbQTuTS5IK
         OeXQ6nrkT9Bd4Qt0uMC4Y+o5BFSl/vCs6vh+goUn82K8we93esbnTH30D9q2NkLmgTO0
         I8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J9mnqO6eJ4ZveGNY3D4ObFWr3/57QctvngM8TX1zOA8=;
        fh=kGFU+B1Mz6yA0oGrBGDmreTNOhvjIuQTrIW6ZGonGXo=;
        b=SoXJ80gjNogOi76zWe2pABrJfKMDqV+rMu1uphmX7b9xIJBwavJgpCQtsxluRoLWMs
         Mbe98Yiur2vCKVnX2IC8zVMdnckeFjoNgTQbNtdg4AHH0GdvU1FGvADugCzO5pnoxTcW
         35wpQYbOvsevDdRTJo6tXoHP4FLD9xfkjZ0XkKC4T9qSPGCZ/w2s8p9JBRm/5gG3nN9W
         yW4uTHhoI7ZQ/XK6aOVvfm7vmWrBv54W7JCoQbFvjSebTiuNVqVUe5uAREjhJcRQ2Z/5
         JrGxKBHkeSb5eHP89h4sy9KDSJPcWaVrkm65Fm7euUVHnLwn5xoniyABIP0M4ru3//K6
         Horw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786550774; x=1787155574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J9mnqO6eJ4ZveGNY3D4ObFWr3/57QctvngM8TX1zOA8=;
        b=bMrCuosYRVpYcUkmfIhmXsv/BaraLNYJJFjJa4C4Qva6/fBZuz9TPtaWzwJsyfjacQ
         huujSeJbEOQeDrR6enOI8fy9RDuBfT9gQghuZKmnrCHJrM+DmzjwZJHO4I5wupW0jyLv
         +d//LTlHJ21GqcHrPsV2LQuB0wK3ew5HWZP3Tn3nZO1JizkQ/sXQsqK77KC7PZ9Y6U8z
         KS8FyhXijHc0Bg0yCwi29ZZxHkssTraCF8smtcY3F50aQChzrK1XwKNN1sx/fOFpKhfB
         C88iVJYliM1Ayt+ZlI1XqpzKabt/Uo4vG0uJWPIYHcFNj0+2QULCWB4xPwPF3UyLawoI
         tpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786550774; x=1787155574;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9mnqO6eJ4ZveGNY3D4ObFWr3/57QctvngM8TX1zOA8=;
        b=hsOpP2pqeaYkXRPIK0f8OG7uNtWvGC53sIPRWyndDqObHh0atOj27akp1Ysu30CvmV
         8YdnpLUeE6HKDJbtXZTrIJb68BKAsUXdoKWY3aD53TBOq3bWVg8ubPqqKz3ZAahWmifI
         ScyzR35Z5eC+JE9iu5tmse9mi6BtJWtABMQEl/DtQOApu2A3JKFcsdnX4DF8WZW+NuPo
         iK4JuxIllvETvYGthsw1VD9FJJWDryFxZokgqcoHV+wepvU7hSplwicVMYtWN3x0QfiZ
         OqGGzSGb6a776pd5wcRBsI5Uxa7jjmojoMWSORwXiXQDQ97RvKP29YTrkDx3YedQP/5e
         reRg==
X-Forwarded-Encrypted: i=1; AHgh+RqUoCKWCbPXDe37ef45EiTlfX26qAokFwD3cU1KQRKPAjePLs+u71eCD2PAwskEIYBKj1JNQi/IDHVZuEV/tRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGXIiemq7ailpTdJVDTcOt7R7fK05cb8szA5Dcug8DROuHcIWm
	5P6cQQmhzi4Ke60k0dbk+Q8FFDeGu/9Ed1lTJHaFvALNj08MNIdHWtPXHx3dXic2fX9Jf57vkj+
	VfLWqYpiZNdeeabcEAW6LgJZvuejnnapVgmB3QFUw
X-Gm-Gg: AR+sD12DK1YMWJrRaY84pAnN/ium/YKf5BQv034cQpNNCde6cz3JRq+q7lX93IKBz+5
	3EeG65Doc4tv9YHaos8p6bGMgF9PjvPQvyiydKmFKv5qaTGnfGsnkt65ztd971OZIE3rSBzvo1m
	zvugOSWVGV+SoxgsIl8I3THk+++QKLLe38rcgnLmqRPVib6U7wyplerSKQdNyXC5o/7z/bcDrwz
	qodp4IeGMkfYXWaqMlYBRdomZF9F2lxzO2gNLDCJfKMBq38VMWAPFmHMitqpsAml9hLghkZeKFw
	B65Q27cqrz2+8nanCvUtOCAqPY2wo4b+gzcZVSgQUAAugQ96wKsPZ+AvHy0Vq4cuFnU14NeiTJf
	qwQDZrP9S0Q6Y98cyHrpnXwfZOSfJ9nbyWTVffbWRag==
X-Received: by 2002:a05:600c:a192:b0:495:4593:616c with SMTP id
 5b1f17b1804b1-4997c2e7c70mr1158565e9.1.1786550773969; Wed, 12 Aug 2026
 09:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811204123.3198370-1-tjmercier@google.com> <CAO_48GEUhpyeenX8Vu1NoDnvzib5FGv3rOBYNYwQEWu1-6cjaQ@mail.gmail.com>
In-Reply-To: <CAO_48GEUhpyeenX8Vu1NoDnvzib5FGv3rOBYNYwQEWu1-6cjaQ@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 12 Aug 2026 09:06:01 -0700
X-Gm-Features: AUfX_myIZHpwdUvC8ZYvqUsuTjt-Hphx_vEEPobdfDAGB6v3g7pueyskoXW0GVA
Message-ID: <CABdmKX0uiX=QKFAYgwwBPHW-X3vh-Rm7w-cNp9EsJzQarTzDpQ@mail.gmail.com>
Subject: Re: [PATCH] kselftests: dmabuf-heaps: Open heap device files O_RDONLY
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, christian.koenig@amd.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 8:02=E2=80=AFAM Sumit Semwal <sumit.semwal@linaro.o=
rg> wrote:
>
> Hello T J,
>
> On Wed, 12 Aug 2026 at 02:11, T.J. Mercier <tjmercier@google.com> wrote:
> >
> > Write permissions on the /dev/dma_heap/* device files are not required
> > to issue ioctls and allocate dmabufs. Applications should be opening
> > these file as O_RDONLY. The BPF dmabuf_iter selftest already does
> > this. [1]
> >
> > Users are pointing to these selftests as examples of how use dmabuf,
> > and encountering permission errors on systems where write permissions
> > are not available on /dev/dma_heap/*. Apply the principle of least
> > privilege to selftests which open dmabuf heaps by removing the write
> > access mode and using O_RDONLY for the open() instead.
>
> Thanks for the patch.
> >
> > The same is true for the vgem test using /dev/dri/card.
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c?h=3Dv7.1#n49
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

Thanks for the quick revieews John, Christian, and Sumit!
