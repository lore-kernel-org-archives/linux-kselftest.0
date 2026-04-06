Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D4A19CC0C
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 23:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775517153; cv=none; b=B6guHKrMZOuBI9uWXyrhbCHRn5+s/c8rW71mjf6SEldi5UBESCX2Nks5jvyyhVP8R4FZFhLXJqHr2uXBsGGh26X0x7KU0cHPS4xcuCnQnSQBz08LfycFC7K4OVpM/u9PBcwyWpcMB0G1Vtz1+khQJM8k8DOC1OQ57QBjns+WwFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775517153; c=relaxed/simple;
	bh=WOp6SYYDY8immBhGTtDhVqEF4aEQt0yrJ7yko/SLIyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPjpmC6RterubXgfVKby8kllUJloFb+2LsQGq6PIkstX+tzKBsoLxlDKcgQmDGV8OpEK4/QxRZKjSYoEM5KQ44z1hxjRY1pD5+lWEV9/44kir4FLlLDV6nLOVzW+G7bHV7udif9OUIIiMHs1I3aK+WAjHgJOTtK0sli76QoMS/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F8PI96Vx; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F8PI96Vx"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3591cc98871so1860695a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 16:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775517151; x=1776121951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=siCrx32nh2+8OpasRtqXmP8hQkcGaPp8sX8b0aEt65g=;
        b=F8PI96VxV0MdhHMf/JpPWXiHG3i6g9t0cmSCQjPCmz6ZRRpeejsIejzhoTSKabup8Z
         H1O+mrWUE5t/8NWtN1mevUjXyK99kJRARZSmnC0j2XTW7srMn0ci97svt9SAYu2m+U+U
         DU0i3kleqXAcI741duSGSymNXoD0B1qUWtb8CyhGPabVTfF+Hu+HgKu9XSh6FfNWoMht
         0mrlnQNRH3y+MdysdP4pmLKCyUgt65i6YCCyZRiAxlzUjIjb/kHv16YCon+KxoH5tXar
         lYeTsiSq+vTDlq9mZfNM9KE28LRUjdbNqaAt5jR6WC+cYn57hjoe/agifoMQHj8bSy3t
         UWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775517151; x=1776121951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siCrx32nh2+8OpasRtqXmP8hQkcGaPp8sX8b0aEt65g=;
        b=lWmMjHlESk8mPau7HR3UwL1+KtlW1jsBUPEHCuLCgy971CQJLoXFAHwsr7cJi0enQU
         YoqYigC+BrMyn2YudVebnodrXLhsHNPhwJ3s2AITjCxEzMxY9ox/Vv0lBPniXLVXAMfB
         NomjPM5mO6TqaaeOgEn3TmsWorLFMJDC3FggbZhHCl0ADBWOKC31ATpBYxG3vTRosacF
         19xCzV1oZpYKLoIiaZmjIOc++qUok5OqhpXpdLCdgK4kjOsTbxi+3DX+CjPX+bhrN5eI
         v+8+NXmeO+XX9Daq7Cuxp9b9UGUZcen//uEWdbL4BluY9HrtxB9Mri55nqxlRM0cP/ZM
         mJIg==
X-Forwarded-Encrypted: i=1; AJvYcCUxyQzmrpf0+bYNYCZPm3VRn5kHr+pgDBgVLX05ffZm/6o/NTCqyBF0VlTS/PTvjqIB4KSmE6//AzoGeOWs3kY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIyU9MGSJ0wKytQUHBs0DLAn5w4dyNMuzNBetplx4W2rddaL8R
	+yZwuhcirRyXdCKFDO3+g+EUgvaf7a4A/V7OklFCRanrG6w5JUqSW4Ql31mwUpOnYA==
X-Gm-Gg: AeBDiesFwdTP8DPQNtLoa8Ho/TPnlZHGx26Oo6xJBIsq8r/rQlW7C8X8bG4XY5IwTPg
	15zpncXmOuLMCMi2RDYtKDmnuQgwpISnCapQ5V16xK8frdr8sB/YHvAJbksikLEfUnGiUXfJd+x
	sD7ogfGYHH+e75AaDvNh9+r7f/Z3X8SYfjgqbjKA/RCddGRuSum2ChcxCPJIDBvh94VAuStUfT6
	6Jn8Gegkcv8MDUTFdU5GVqU2pPGEHHcVmAA/PdxEzv8tp98ot1I5upSRRUdPX5+3ZjDrVWqj+is
	bmUseLaLfFuXwSua9/s01BIefA/JFmrUWmOCPlRu1BeFxOTyI9Xm+GlOSD8DvprS6cbkHFmF6TY
	QqJwYhBRUj9Mg2oTckqh2svroMNuQhEWuN/gEq2a7y9mJSxP31gZ8raP1Qljqb+ZArxxCSiFVyO
	UMkvjAU+lAN/d0vkidOrCBJ+Gse76bCAGoJVHiIzaFsFyDyllzxjTjIV/4aONAxg==
X-Received: by 2002:a17:90b:4ecc:b0:35c:30a8:32a with SMTP id 98e67ed59e1d1-35de67e8aa9mr13334095a91.9.1775517151102;
        Mon, 06 Apr 2026 16:12:31 -0700 (PDT)
Received: from google.com (239.23.105.34.bc.googleusercontent.com. [34.105.23.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe9379f3sm20116802a91.9.2026.04.06.16.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:12:30 -0700 (PDT)
Date: Mon, 6 Apr 2026 23:12:26 +0000
From: David Matlack <dmatlack@google.com>
To: Rubin Du <rubind@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 3/4] selftests/vfio: Allow drivers without send_msi()
 support
Message-ID: <adQ92tHGZVGKG0t5@google.com>
References: <20260403234444.350867-1-rubind@nvidia.com>
 <20260403234444.350867-4-rubind@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403234444.350867-4-rubind@nvidia.com>

On 2026-04-03 04:44 PM, Rubin Du wrote:
> Allow drivers that cannot trigger MSI interrupts to leave the send_msi
> callback NULL. Add an fcntl_set_msi_nonblock() wrapper that only sets
> nonblocking mode when send_msi is available, and update ASSERT_NO_MSI()
> to skip when the driver lacks MSI support. The send_msi test SKIPs and
> mix_and_match skips the MSI portion per iteration.
> 
> Signed-off-by: Rubin Du <rubind@nvidia.com>

Reviewed-by: David Matlack <dmatlack@google.com>
