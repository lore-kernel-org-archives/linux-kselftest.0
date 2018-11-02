From: lkp at intel.com (kbuild test robot)
Date: Fri, 2 Nov 2018 12:01:13 +0800
Subject: [PATCH v3 1/2] kretprobe: produce sane stack traces
In-Reply-To: <20181101083551.3805-2-cyphar@cyphar.com>
References: <20181101083551.3805-2-cyphar@cyphar.com>
Message-ID: <201811021101.rWKQtzrq%fengguang.wu@intel.com>

Hi Aleksa,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tip/perf/core]
[also build test ERROR on v4.19 next-20181101]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Aleksa-Sarai/kretprobe-produce-sane-stack-traces/20181102-034111
config: i386-randconfig-h1-11021006 (attached as .config)
compiler: gcc-4.9 (Debian 4.9.4-2) 4.9.4
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All errors (new ones prefixed by >>):

   kernel/kprobes.c: In function 'pre_handler_kretprobe':
   kernel/kprobes.c:1846:10: error: variable 'trace' has initializer but incomplete type
      struct stack_trace trace = {};
             ^
   kernel/kprobes.c:1846:22: error: storage size of 'trace' isn't known
      struct stack_trace trace = {};
                         ^
>> kernel/kprobes.c:1858:3: error: implicit declaration of function 'save_stack_trace_regs' [-Werror=implicit-function-declaration]
      save_stack_trace_regs(regs, &trace);
      ^
   kernel/kprobes.c:1846:22: warning: unused variable 'trace' [-Wunused-variable]
      struct stack_trace trace = {};
                         ^
   kernel/kprobes.c: In function 'kretprobe_save_stack_trace':
>> kernel/kprobes.c:1922:16: error: dereferencing pointer to incomplete type
     for (i = trace->skip; i < krt->nr_entries; i++) {
                   ^
   kernel/kprobes.c:1923:12: error: dereferencing pointer to incomplete type
      if (trace->nr_entries >= trace->max_entries)
               ^
   kernel/kprobes.c:1923:33: error: dereferencing pointer to incomplete type
      if (trace->nr_entries >= trace->max_entries)
                                    ^
   kernel/kprobes.c:1925:8: error: dereferencing pointer to incomplete type
      trace->entries[trace->nr_entries++] = krt->entries[i];
           ^
   kernel/kprobes.c:1925:23: error: dereferencing pointer to incomplete type
      trace->entries[trace->nr_entries++] = krt->entries[i];
                          ^
   cc1: some warnings being treated as errors

vim +/save_stack_trace_regs +1858 kernel/kprobes.c

  1819	
  1820	#ifdef CONFIG_KRETPROBES
  1821	/*
  1822	 * This kprobe pre_handler is registered with every kretprobe. When probe
  1823	 * hits it will set up the return probe.
  1824	 */
  1825	static int pre_handler_kretprobe(struct kprobe *p, struct pt_regs *regs)
  1826	{
  1827		struct kretprobe *rp = container_of(p, struct kretprobe, kp);
  1828		unsigned long hash, flags = 0;
  1829		struct kretprobe_instance *ri;
  1830	
  1831		/*
  1832		 * To avoid deadlocks, prohibit return probing in NMI contexts,
  1833		 * just skip the probe and increase the (inexact) 'nmissed'
  1834		 * statistical counter, so that the user is informed that
  1835		 * something happened:
  1836		 */
  1837		if (unlikely(in_nmi())) {
  1838			rp->nmissed++;
  1839			return 0;
  1840		}
  1841	
  1842		/* TODO: consider to only swap the RA after the last pre_handler fired */
  1843		hash = hash_ptr(current, KPROBE_HASH_BITS);
  1844		raw_spin_lock_irqsave(&rp->lock, flags);
  1845		if (!hlist_empty(&rp->free_instances)) {
> 1846			struct stack_trace trace = {};
  1847	
  1848			ri = hlist_entry(rp->free_instances.first,
  1849					struct kretprobe_instance, hlist);
  1850			hlist_del(&ri->hlist);
  1851			raw_spin_unlock_irqrestore(&rp->lock, flags);
  1852	
  1853			ri->rp = rp;
  1854			ri->task = current;
  1855	
  1856			trace.entries = &ri->entry.entries[0];
  1857			trace.max_entries = KRETPROBE_TRACE_SIZE;
> 1858			save_stack_trace_regs(regs, &trace);
  1859			ri->entry.nr_entries = trace.nr_entries;
  1860	
  1861			if (rp->entry_handler && rp->entry_handler(ri, regs)) {
  1862				raw_spin_lock_irqsave(&rp->lock, flags);
  1863				hlist_add_head(&ri->hlist, &rp->free_instances);
  1864				raw_spin_unlock_irqrestore(&rp->lock, flags);
  1865				return 0;
  1866			}
  1867	
  1868			arch_prepare_kretprobe(ri, regs);
  1869	
  1870			/* XXX(hch): why is there no hlist_move_head? */
  1871			INIT_HLIST_NODE(&ri->hlist);
  1872			kretprobe_table_lock(hash, &flags);
  1873			hlist_add_head(&ri->hlist, &kretprobe_inst_table[hash]);
  1874			kretprobe_table_unlock(hash, &flags);
  1875		} else {
  1876			rp->nmissed++;
  1877			raw_spin_unlock_irqrestore(&rp->lock, flags);
  1878		}
  1879		return 0;
  1880	}
  1881	NOKPROBE_SYMBOL(pre_handler_kretprobe);
  1882	
  1883	/*
  1884	 * Return the kretprobe_instance associated with the current_kprobe. Calling
  1885	 * this is only reasonable from within a kretprobe handler context (otherwise
  1886	 * return NULL).
  1887	 *
  1888	 * Must be called within a kretprobe_hash_lock(current, ...) context.
  1889	 */
  1890	struct kretprobe_instance *current_kretprobe_instance(void)
  1891	{
  1892		struct kprobe *kp;
  1893		struct kretprobe *rp;
  1894		struct kretprobe_instance *ri;
  1895		struct hlist_head *head;
  1896		unsigned long hash = hash_ptr(current, KPROBE_HASH_BITS);
  1897	
  1898		kp = kprobe_running();
  1899		if (!kp || !kprobe_is_retprobe(kp))
  1900			return NULL;
  1901		if (WARN_ON(!kretprobe_hash_is_locked(current)))
  1902			return NULL;
  1903	
  1904		rp = container_of(kp, struct kretprobe, kp);
  1905		head = &kretprobe_inst_table[hash];
  1906	
  1907		hlist_for_each_entry(ri, head, hlist) {
  1908			if (ri->task == current && ri->rp == rp)
  1909				return ri;
  1910		}
  1911		return NULL;
  1912	}
  1913	EXPORT_SYMBOL_GPL(current_kretprobe_instance);
  1914	NOKPROBE_SYMBOL(current_kretprobe_instance);
  1915	
  1916	void kretprobe_save_stack_trace(struct kretprobe_instance *ri,
  1917					struct stack_trace *trace)
  1918	{
  1919		int i;
  1920		struct kretprobe_trace *krt = &ri->entry;
  1921	
> 1922		for (i = trace->skip; i < krt->nr_entries; i++) {
  1923			if (trace->nr_entries >= trace->max_entries)
  1924				break;
  1925			trace->entries[trace->nr_entries++] = krt->entries[i];
  1926		}
  1927	}
  1928	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 29078 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181102/8e51381b/attachment-0001.bin>
