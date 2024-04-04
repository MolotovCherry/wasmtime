;;! target = "riscv64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation -W memory64 -O static-memory-maximum-size=0 -O static-memory-guard-size=0 -O dynamic-memory-guard-size=0"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i64 1)

  (func (export "do_store") (param i64 i32)
    local.get 0
    local.get 1
    i32.store offset=0x1000)

  (func (export "do_load") (param i64) (result i32)
    local.get 0
    i32.load offset=0x1000))

;; wasm[0]::function[0]:
;;       addi    sp, sp, -0x10
;;       sd      ra, 8(sp)
;;       sd      s0, 0(sp)
;;       mv      s0, sp
;;       ld      a5, 0x68(a0)
;;       ld      a4, 0x60(a0)
;;       lui     a0, 1
;;       addi    a0, a0, 4
;;       sub     a5, a5, a0
;;       sltu    a5, a5, a2
;;       add     a4, a4, a2
;;       lui     a0, 1
;;       add     a4, a4, a0
;;       neg     a2, a5
;;       not     a5, a2
;;       and     a0, a4, a5
;;       sw      a3, 0(a0)
;;       ld      ra, 8(sp)
;;       ld      s0, 0(sp)
;;       addi    sp, sp, 0x10
;;       ret
;;
;; wasm[0]::function[1]:
;;       addi    sp, sp, -0x10
;;       sd      ra, 8(sp)
;;       sd      s0, 0(sp)
;;       mv      s0, sp
;;       ld      a5, 0x68(a0)
;;       ld      a4, 0x60(a0)
;;       lui     a3, 1
;;       addi    a0, a3, 4
;;       sub     a5, a5, a0
;;       sltu    a5, a5, a2
;;       add     a4, a4, a2
;;       lui     a0, 1
;;       add     a4, a4, a0
;;       neg     a2, a5
;;       not     a5, a2
;;       and     a0, a4, a5
;;       lw      a0, 0(a0)
;;       ld      ra, 8(sp)
;;       ld      s0, 0(sp)
;;       addi    sp, sp, 0x10
;;       ret