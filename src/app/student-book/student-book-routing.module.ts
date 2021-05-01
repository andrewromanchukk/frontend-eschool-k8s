import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { StudentBookComponent } from './student-book/student-book.component';

const routes: Routes = [
  {
    path: '',
    component: StudentBookComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class StudentBookRoutingModule {}
