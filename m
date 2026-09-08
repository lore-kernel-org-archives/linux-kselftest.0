Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0544858F09E
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 16:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886721; cv=pass; b=W4Y6Z/ho7esw4k5silCGIZKs8S7REQvgeh9svSaUZa+MJbtu0Ao7Dym/GXMkEJhtM9BMypFSjm2IbbDFMns2kwZPXXHbUPq5S1k3sNm3cMQckrdJfiUQGqHp1x9xwDCl4JKQSsxCDEsm4Q1kWw4J9lreVemF9VeNXvmopQasvPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886721; c=relaxed/simple;
	bh=ULxa4JRrSAZB5pD9oIq2oZNnuuD6C8U1jqAHoElMSdA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ad+mpgTAeQEHeuyxda+GRH8OwauzhmBSuTyikex+BTIqjfH533ayFPHOakEHjbVBbAm9QxlqtlcoBVY1GerY14mDIrJqK/bAIXMKqCN1mjuqxSaWQMSHkxBkEAukXlSMN/qoJI5/C4+XbnzdNy6iywUVyPmJ3TJYHCyaw895UYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eMz+XpJH; arc=pass smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eMz+XpJH"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-9103e193381so44408196d6.3
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 09:58:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788886702; cv=none;
        d=google.com; s=arc-20260327;
        b=clXzO25crUvlt0VkzfQuk8SLeeORdFHO0vhGzLOrCQ4ZwBFf8De/q8f36d0KMZQnnh
         KKxcVymlPWvVHk3qh1qseGGqqjvtVBzdKruiSoZ2EzT8/UXpm/nrdQG0eJVC92xN7nEI
         mMW3O1zSJccSclXPQ331tbfKfgdE7EobPe+kKDihB5K9qM/ZjACXmCdZo3hcL+b/MzxP
         Q3x/epgd8cVseR/Meq/m5GQTLM8WnxIdGCTAlLbGhBDgDIprWc++1VurrZZ283jCAeho
         961PbKfxqn5meaNODhf3PXeFYstetN9nSS8tpMvL3JRweZeaUcCsZ/lkyH8PZH8nHZP7
         YTvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=8fcdr/hrzW8YjLnM5OVm+g395+cNXrG+fCcu71g0lZU=;
        fh=5yhMSm02zgJwksgeonzQTtaFxMNTzBJpzX60pnBZYc0=;
        b=JCuFPxyhg/uzAHb5AvrKo1EcN96IsSDfL7uZADhYLDOhRZGqhzFkVN1F1pPCAdm2c0
         Fnr7Czni6Vypko+eg4ZlKfV2LDtZHPhK8gCWCe5AmM3Jyp1rEnQ/V2T82kGGxJr4NFgC
         V2OBSVsGZOmsSjAdCtnGCNaAVLeMUwKh9iTaTjHinMfveOsZMfT/Es4ACAU5L7MKfQxc
         YP7VDkUHz+IEdwmWXbGejVY9iiINwnnh2Yc9jAzETI3x7qGDcr/qIlprpuldzVgYeI4u
         KwHk5OhW5LR+2RtDC5sy6E/YXbHwQRixiiNsP9lVCtCex0W4jA4yrXpKFTpGBKM5OqUj
         R44Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788886702; x=1789491502; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8fcdr/hrzW8YjLnM5OVm+g395+cNXrG+fCcu71g0lZU=;
        b=eMz+XpJH8AC4z0HU59N10CwiV7jWB2XkXiXfbJIdwPg9pCizkaqKgQ2pA+sDReAkRu
         symxpB9EJaTSk3ubMMpTtNNds1xRV/H1uDJHELk26ThbzxwBw0ZicDxeurCbCsadwFE/
         +tXRzwxQLtqQq83teNHqJZ4nd8xfGB7sLCwT/Ccir7u60wm5o+R8fFsyqG848ZI5pXsJ
         zG8B876bNDs/OPgeecJK/ktGSxXN5IT+eJr7oB4IdTb1tjj6a5sNSTZcgtNJYBCtpJJE
         bvRm8av7+CH9Tdmunx74W7KDnay6nWuFHB2Kidhh8mcdhtEeA5OOQvzbF4JDUEBkAC+3
         pRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886702; x=1789491502;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8fcdr/hrzW8YjLnM5OVm+g395+cNXrG+fCcu71g0lZU=;
        b=ZrZYbNU0DRiugj9VTYGn/x6GhG8YxVeD8SJ8RzvEDaWGz56p8+qJZv7vebpzLLbM/h
         8bwLXPj6KYxNKtzPGd/0l/kwMTx+SoIsLyT1OWdKXTtN1xyjdJNzgoJ6VwJ8739ldkd2
         wNTvK/iLt5dcLX+qkW9f6DjkuVeOzSDIfBpy7e9WQyS8U91ycqhtC8zwr4wTlTY/7bxP
         nlQuh4hkKYEjxYwvgnpNQUoaAX8i/dNp8GT/yGGaDB0Bdh5dxeN8zjEsXYG69v6kszLU
         RIUMW/xolLF2Gl30n/sOpOs/YWLGeSDh5uOnkSAjXo8CoLre7HUu6t10bXZuGxe/L881
         WO/A==
X-Forwarded-Encrypted: i=1; AKwUvBwM277y127N98TdCEM59V5pyo4to2jvVuZFYkALkHpAWiylNeRFfQIMpBB8PkVtgF8epwteuLJlbYIoT9Xwv1o=@vger.kernel.org
X-Gm-Message-State: AFuF++k2bp9ltGywZKtq9D7FV041f7YhHHkikizSxSNEq9Rm4C8vW7Mz
	fyNLakz1/LTqt9mL35MOnuQ6ff1kpHAovay4sQCxhTDkZ5LJbF9eK6za1kwRfJt2qdp0cqMk0s/
	R9Yjp25mfGfBc4gKMXGoumCtQMoJSW7QeoGPhmGnq
X-Gm-Gg: AYBFou35MyO0YireCiqE7YtNGnj2HtMS5ZE8n7/THhAbLWViC16r1hbM612g9lANwKJ
	fk8pnDrGyH7/exwNKa465/roj7eCp5WC14wXNcMdMcoL9TP9sgbN2ia2nIwa1SA1LyI6ASz1Nh2
	8+QhklAdPzu/ANEmzK5tVAePwSthHRZLpsIaWIYooD0a94s6XgPzm5ILql/KrdYUFWHKVOsEwXn
	unDj6Ro3yPhYmczilmro2CQCJd+xqeR94o0ImKqlxUGinU2Dh/QGCEXchUH5EQHNsy9blW/djo+
	TuAI5uTGxJKJPNXB00afEhvhSoBOD3AA5DIVT3ICwxBJdgVi2fqV8n2uhbHFJvPCPRhDE4agcJz
	A1StEFLzKi1T573B7TM5w/tA1hmubNWo=
X-Received: by 2002:a05:6214:c24:b0:90c:ab32:d9 with SMTP id
 6a1803df08f44-9103ef04cbemr59785766d6.9.1788886701269; Tue, 08 Sep 2026
 09:58:21 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 09:58:20 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 09:58:20 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260722-tdx-selftests-v14-1-15ad654a50db@google.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com> <20260722-tdx-selftests-v14-1-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 09:58:20 -0700
X-Gm-Features: AcwNN1Ul0Nx7jhJwVNNvygXIUovvrGXjOMRCxh0xNG50wROb5Y6Vd7rvg4wlMm4
Message-ID: <CAEvNRgFgE3DFw1=zc65iMy1gNyPryVJuKPMrNF+ssXydtuEazA@mail.gmail.com>
Subject: Re: [PATCH v14 01/22] KVM: selftests: Add macros to simplify creating
 VM shapes for non-default types
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> From: Sean Christopherson <seanjc@google.com>
>
> Add VM_TYPE() and __VM_SHAPE() macros to create a vm_shape structure given
> a type (and mode), and use the macros to define VM_SHAPE_{SEV,SEV_ES,SNP}
> shapes for x86's SEV family of VM shapes.  Providing common infrastructure
> will avoid having to copy+paste vm_sev_create_with_one_vcpu() for TDX.
>
> Use the new SEV+ shapes and drop vm_sev_create_with_one_vcpu().
>
> Opportunistically move the existing VM_SHAPE() (now __VM_SHAPE()) macro
> below the definitions of VM_MODE_DEFAULT so that all of the SHAPE/TYPE
> macros are bundled together.
>
> No functional change intended.
>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
>
> [...snip...]
>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
