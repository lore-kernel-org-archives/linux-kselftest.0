Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930754;
	b=2igjrSQX1ry6MIZ9ku0dJAC9ZO8DWE4f9Mly6j9RFjPS6nF486TUn9rpXaM0fLfzXM5Q
	 LWiyMDPztBKRW2SlPp9JB+Di69ejrHDOUw7M+neM6dKc0U/HnB+Cm2Rnu4yEL40WmZoM1
	 /zFZJOHaJEo1gvlh7r8+HMAlDg3SvFGlUrkS3HKkf3wapH/cEwsBu2YyQGKHitjPqDQ1B
	 0qBdxqraQ3In149Ei7fCpl2xkDujm9FDGfVu5fh+BY3I8Gm7HgyKylJ+YCPQwUhjLqNc1
	 J37JE9s48FGTWn+TSuuluFYASIvX3rSxjsgm+APa9HJik+ojVwQW5SX9xTWIHZioFlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930754;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=CwkcucwhqEMaEXV/tKbkgRirE2/Vf8LnyzYqxi1MaCo=;
	b=aEtluD8aJLVZe0o+t258KVg71cHcLTEEVCdgv07PpDSoGXD8YyyA6T2XpJPLCFmorQPL
	 4VhwIqj2C5BF0lgzvdXNPoxajOAsRpA+9ThM5FOFYh9uEhg25YTP77kzXV6XIh35Md403
	 nOKXigm9C7zqEtav5gW/X7aR1x689PDat0tGS74QAgEi/6gQzWDdscudUCts8KmADyvgg
	 sGJrAk/4bMEppBvr6e/HdahRFTikapCRzyqQoxhWKUR4hsx34FrUKTux/YnvBBT9eX973
	 ga1kqlkHPZKWe6pSrtLLC/mJTzhSztzLIyQrCLNgMXIc468ZzumCqNZaQuuYNVxbE+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jiMcpdE1;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEE5606A31C;
	Tue, 17 Nov 2026 15:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BEE5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jiMcpdE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794930754; x=1826466754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TvP1lwl2p/FoqY4pTZ0m2d7ltv5FWa0x0Go76nDAdas=;
  b=jiMcpdE1cT2DlU0f+6oF4SW4T2RyRVfD/1lF0Yp8/38zJYm3V9bejzKm
   tAeQeWSMUkOemglxifdp1kvvoOIdc700IJFb3SqnEDDgrfmMBUdcPm2w8
   mzHsyu1F6xBDUE0BDQpNEkIky48JxvpqUFwuy5jE0/FSpG8N12A4SBtHK
   9VekOHWaSPjURgr7H5EbriAURiu8DmVMkRN1xpMMZ9ZA4ML/6Pw2nFDWQ
   5YBtU/uNdTyt+yf4el+UGjsv5TmaeFSS8PQwQOaY8HjMnrbdOfDZKijSQ
   7egKTCrAmaBxJb3dyvMyd00fRNaMYrG38AqFPUYq5Y9/AfVlaMXB1u8Ql
   Q==;
X-CSE-ConnectionGUID: KS/6fLzfQwCnRbPNuf7/Ww==
X-CSE-MsgGUID: Yf5hp0BGRXiuPhmFNlSdPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3607162"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3607162"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 07:52:33 -0800
X-CSE-ConnectionGUID: nQJGT9vrTBm78WVKeq8c9g==
X-CSE-MsgGUID: 4jDXrtXFRI22ZtaMHJz+Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11682989"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 17 Nov 2026 07:52:30 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTLTu-00000001Bwd-1doc;
	Tue, 17 Nov 2026 15:52:26 +0000
Date: Tue, 17 Nov 2026 23:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: Nylon Chen <nylon.chen@sifive.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Nylon Chen <nylon.chen@sifive.com>
Subject: Re: [PATCH 1/2] riscv: traps: Add support for vector misalignment
 handler
Message-ID: <202611172359.8iKyKE2d-lkp@intel.com>
References: <20261116-riscv-vector-misaligned-v1-1-6c4d0ca905b7@sifive.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-riscv-vector-misaligned-v1-1-6c4d0ca905b7@sifive.com>

Hi Nylon,

kernel test robot noticed the following build errors:

[auto build test ERROR on 05441d697f7f9a927264f4058cbbc6a03dfcac9d]

url:    https://github.com/intel-lab-lkp/linux/commits/Nylon-Chen/riscv-traps-Add-support-for-vector-misalignment-handler/20261116-233837
base:   05441d697f7f9a927264f4058cbbc6a03dfcac9d
patch link:    https://lore.kernel.org/r/20261116-riscv-vector-misaligned-v1-1-6c4d0ca905b7%40sifive.com
patch subject: [PATCH 1/2] riscv: traps: Add support for vector misalignment handler
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20261117/202611172359.8iKyKE2d-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611172359.8iKyKE2d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611172359.8iKyKE2d-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/traps_v_misaligned.c: In function 'misaligned_v_ld_emulator':
>> arch/riscv/kernel/traps_v_misaligned.c:670:17: error: implicit declaration of function 'kernel_vector_begin' [-Wimplicit-function-declaration]
     670 |                 kernel_vector_begin();
         |                 ^~~~~~~~~~~~~~~~~~~
>> arch/riscv/kernel/traps_v_misaligned.c:676:17: error: implicit declaration of function 'riscv_v_enable'; did you mean 'riscv_ipi_enable'? [-Wimplicit-function-declaration]
     676 |                 riscv_v_enable();
         |                 ^~~~~~~~~~~~~~
         |                 riscv_ipi_enable
>> arch/riscv/kernel/traps_v_misaligned.c:768:17: error: implicit declaration of function 'kernel_vector_end'; did you mean 'kernel_cred'? [-Wimplicit-function-declaration]
     768 |                 kernel_vector_end();
         |                 ^~~~~~~~~~~~~~~~~
         |                 kernel_cred
>> arch/riscv/kernel/traps_v_misaligned.c:775:17: error: implicit declaration of function 'riscv_v_disable'; did you mean 'riscv_ipi_disable'? [-Wimplicit-function-declaration]
     775 |                 riscv_v_disable();
         |                 ^~~~~~~~~~~~~~~
         |                 riscv_ipi_disable


vim +/kernel_vector_begin +670 arch/riscv/kernel/traps_v_misaligned.c

   643	
   644	int misaligned_v_ld_emulator(struct pt_regs *regs, unsigned long insn)
   645	{
   646		int ret = 0;
   647		unsigned long vl, vtype, vlenb, vstart, base, stride;
   648		unsigned long vd, vs2, view, vsew, vlmul, emul, vemul;
   649		unsigned long len, nf;
   650		bool illegal, masked;
   651		bool is_usermode = user_mode(regs);
   652		u8 mask[VLEN_MAX / 8];
   653		u8 bytes[8 * sizeof(u64)];
   654	
   655		/*
   656		 * User mode: IRQs are enabled by do_trap_misaligned(), so we can use
   657		 * kernel_vector_begin() which saves the user's vector state to datap.
   658		 * We then read CSRs from the saved vstate (not hardware) because
   659		 * kernel_vector_begin() -> riscv_v_vstate_save() modifies the hw CSRs.
   660		 *
   661		 * Kernel mode: IRQs are disabled (NMI-like context), may_use_simd()
   662		 * returns false, so kernel_vector_begin() cannot be used. Instead we
   663		 * enable vector directly and read CSRs from hardware; get_vreg/
   664		 * set_vreg access individual register elements in place via vstart +
   665		 * vsetvli(tu), without disturbing the rest of the register file.
   666		 */
   667		if (is_usermode) {
   668			struct __riscv_v_ext_state *vstate = &current->thread.vstate;
   669	
 > 670			kernel_vector_begin();
   671			vl = vstate->vl;
   672			vtype = vstate->vtype;
   673			vstart = vstate->vstart;
   674			vlenb = vstate->vlenb;
   675		} else {
 > 676			riscv_v_enable();
   677			vl = csr_read(CSR_VL);
   678			vtype = csr_read(CSR_VTYPE);
   679			vstart = csr_read(CSR_VSTART);
   680			vlenb = csr_read(CSR_VLENB);
   681		}
   682	
   683		base = GET_RS1(insn, regs);
   684		stride = GET_RS2(insn, regs);
   685		vd = GET_VD(insn);
   686		vs2 = GET_VS2(insn);
   687		view = GET_VIEW(insn);
   688		vsew = GET_VSEW(vtype);
   689		vlmul = GET_VLMUL(vtype);
   690		illegal = GET_MEW(insn);
   691		masked = IS_MASKED(insn);
   692		len = GET_LEN(view);
   693		nf = GET_NF(insn);
   694		vemul = GET_VEMUL(vlmul, view, vsew);
   695		emul = GET_EMUL(vemul);
   696	
   697		if (IS_UNIT_STRIDE_LOAD(insn) || IS_FAULT_ONLY_FIRST_LOAD(insn)) {
   698			stride = nf * len;
   699		} else if (IS_WHOLE_REG_LOAD(insn)) {
   700			vl = (nf * vlenb) >> view;
   701			nf = 1;
   702			vemul = 0;
   703			emul = 1;
   704			stride = nf * len;
   705		} else if (IS_INDEXED_LOAD(insn)) {
   706			len = 1 << vsew;
   707			vemul = (vlmul + vsew - vsew) & 7;
   708			emul = 1 << ((vemul & 4) ? 0 : vemul);
   709			stride = nf * len;
   710		}
   711	
   712		if (illegal || vlenb > VLEN_MAX / 8) {
   713			if (is_usermode)
   714				force_sig_fault(SIGILL, ILL_ILLOPC, (void __user *)regs->epc);
   715			ret = -EFAULT;
   716			goto out;
   717		}
   718	
   719		if (masked)
   720			get_vreg(vlenb, 0, 0, vlenb, mask, is_usermode);
   721	
   722		do {
   723			if (!masked || ((mask[vstart / 8] >> (vstart % 8)) & 1)) {
   724				unsigned long addr = base + vstart * stride;
   725	
   726				if (IS_INDEXED_LOAD(insn)) {
   727					unsigned long offset = 0;
   728	
   729					get_vreg(vlenb, vs2, vstart << view, 1 << view,
   730						 (u8 *)&offset, is_usermode);
   731					addr = base + offset;
   732				}
   733	
   734				csr_write(CSR_VSTART, vstart);
   735	
   736				for (unsigned long seg = 0; seg < nf; seg++) {
   737					for (unsigned long i = 0; i < len; i++) {
   738						u8 *src = (u8 *)(addr + seg * len + i);
   739	
   740						if (is_usermode) {
   741							if (get_user(bytes[seg * len + i],
   742								     (u8 __user *)src)) {
   743								if (IS_FAULT_ONLY_FIRST_LOAD(insn) &&
   744								    vstart != 0) {
   745									vl = vstart;
   746									break;
   747								}
   748								ret = -EFAULT;
   749								goto out;
   750							}
   751						} else {
   752							bytes[seg * len + i] = *src;
   753						}
   754					}
   755				}
   756	
   757				for (unsigned long seg = 0; seg < nf; seg++)
   758					set_vreg(vlenb, vd + seg * emul, vstart * len, len,
   759						 &bytes[seg * len], is_usermode);
   760			}
   761		} while (++vstart < vl);
   762	
   763	out:
   764		if (ret == 0)
   765			regs->epc += 4;
   766	
   767		if (is_usermode) {
 > 768			kernel_vector_end();
   769		} else {
   770			/*
   771			 * Restore vl/vtype clobbered by get_vreg/set_vreg's vsetvli.
   772			 * vsetvl also resets vstart to 0 (the correct post-insn state).
   773			 */
   774			vsetvl(vl, vtype);
 > 775			riscv_v_disable();
   776		}
   777	
   778		return ret;
   779	}
   780	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
